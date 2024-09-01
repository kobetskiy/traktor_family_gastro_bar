import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_helper.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/models/user_model.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

abstract class AuthService with AuthHelper {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;
  static final _facebookAuth = FacebookAuth.instance;
  static final _googleAuth = GoogleSignIn();

  static Future<void> updatePhoneNumber(User user, String phoneNumber) async {
    AuthHelper.updateUserField(user, 'phoneNumber', '+380$phoneNumber');
  }

  static Future<void> updateName(User user, String name) async {
    await user.updateDisplayName(name);
    AuthHelper.updateUserField(user, 'name', name);
  }

  static Future<UserModel?> getUserData() async {
    try {
      final documentSnapshot = await _firestore
          .collection(DatabaseCollections.usersCollection)
          .doc(_auth.currentUser?.email)
          .get();
      if (documentSnapshot.exists) {
        return UserModel(
          email: documentSnapshot.get('email'),
          id: documentSnapshot.get('id'),
          name: documentSnapshot.get('name'),
          phoneNumber: documentSnapshot.get('phoneNumber'),
        );
      } else {
        log('Document does not exist');
        return null;
      }
    } catch (e) {
      log('Error getting user name: $e');
      return null;
    }
  }

  static Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await updateName(_auth.currentUser!, name);
      if (!context.mounted) return;
      context.router.replaceAll([const AppRoute()]);

      AuthHelper.addUserDataToFirestore(
        id: _auth.currentUser!.uid,
        name: _auth.currentUser!.displayName,
        email: _auth.currentUser!.email,
        phoneNumber: _auth.currentUser!.phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (!context.mounted) return;
      if (e.code == 'email-already-in-use') {
        message = S.of(context).emailAlreadyInUse;
      } else if (e.code == 'invalid-email') {
        message = S.of(context).enterAValidEmail;
      } else if (e.code == 'weak-password') {
        message = S.of(context).passwordIsNotStrongEnough;
      } else {
        message = S.of(context).someErrorOccurred;
      }
      if (!context.mounted) return;
      AuthHelper.showAuthSnackBar(
        context,
        message,
        AuthHelper.failureIcon(context),
      );
    }
  }

  static Future<void> logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!context.mounted) return;
      context.router.replaceAll([const AppRoute()]);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = S.of(context).userNotFound;
      } else if (e.code == "email-already-in-use") {
        message = S.of(context).emailAlreadyInUse;
      } else {
        message = S.of(context).wrongEmailOrPassword;
      }
      AuthHelper.showAuthSnackBar(
        context,
        message,
        AuthHelper.failureIcon(context)
      );
    }
  }

  static Future<void> logOut({required BuildContext context}) async {
    await _auth.signOut();
    await _googleAuth.signOut();
    await _facebookAuth.logOut();
    if (!context.mounted) return;
    context.router.replaceAll([const LogInRoute()]);
  }

  static Future<void> resetPassword(BuildContext context, String email) async {
    String message = '';
    try {
      await _auth.sendPasswordResetEmail(email: email);
      if (!context.mounted) return;
      message = S.of(context).emailWasSentSuccessfully;
      context.router.maybePop();
      AuthHelper.showAuthSnackBar(
          context, message, AuthHelper.successIcon(context));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = S.of(context).userNotFound;
      } else if (e.code == "email-already-in-use") {
        message = S.of(context).emailAlreadyInUse;
      } else {
        message = S.of(context).someErrorOccurred;
      }
      AuthHelper.showAuthSnackBar(
          context, message, AuthHelper.failureIcon(context));
    }
  }

  static Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final googleUser = await _googleAuth.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      AuthHelper.addUserDataToFirestore(
        id: googleUser!.id,
        name: googleUser.displayName,
        email: googleUser.email,
        phoneNumber: null,
      );
      final userCredential = await _auth.signInWithCredential(credential);

      if (!context.mounted) return null;
      context.router.replaceAll([const AppRoute()]);

      return userCredential;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<UserCredential?> signInWithFacebook(
    BuildContext context,
  ) async {
    try {
      final result = await _facebookAuth.login();
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      final userData = await _facebookAuth.getUserData();

      AuthHelper.addUserDataToFirestore(
        id: userData['id'],
        name: userData['name'],
        email: userData['email'],
        phoneNumber: null,
      );
      final userCredential = _auth.signInWithCredential(credential);

      if (!context.mounted) return null;
      context.router.replaceAll([const AppRoute()]);

      return userCredential;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<void> signUpWithApple() async {}
}
