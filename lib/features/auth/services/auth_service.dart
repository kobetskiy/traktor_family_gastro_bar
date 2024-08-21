import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/auth/view/auth_screens.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

abstract class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;
  static final _facebookAuth = FacebookAuth.instance;
  static final _googleAuth = GoogleSignIn();

  static Icon _failureIcon(BuildContext context) => Icon(
        Icons.error_outline_rounded,
        color: Theme.of(context).colorScheme.error,
      );

  static Icon _successIcon(BuildContext context) => Icon(
        Icons.check_circle_outline_rounded,
        color: Theme.of(context).colorScheme.success,
      );

  static _showAuthSnackBar(BuildContext context, String text, Icon icon) {
    final snackBar = SnackBar(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      content: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Flexible(child: Text(text)),
        ],
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<bool> _isUserExist(String? email) async {
    final querySnapshot = await _firestore
        .collection(DatabaseCollections.usersCollection)
        .where("email", isEqualTo: email)
        .get();
    return querySnapshot.docs.isEmpty;
  }

  static void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => page),
      (route) => false,
    );
  }

  static Future<void> updateName(User user, String name) async {
    await user.updateDisplayName(name);
    final userCollection = _firestore.collection(
      DatabaseCollections.usersCollection,
    );
    final querySnapshot =
        await userCollection.where('email', isEqualTo: user.email).get();

    if (querySnapshot.docs.isNotEmpty) {
      final docId = querySnapshot.docs.first.id;

      await userCollection.doc(docId).update({'name': name});
    } else {
      log("User document not found for uid: ${user.uid}");
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
      _navigateTo(context, const AppScreen());
      if (await _isUserExist(_auth.currentUser!.email)) {
        await _firestore.collection(DatabaseCollections.usersCollection).add({
          "id": _auth.currentUser!.uid,
          "name": _auth.currentUser!.displayName,
          "email": _auth.currentUser!.email,
          "phoneNumber": _auth.currentUser!.phoneNumber,
        });
      }
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
      _showAuthSnackBar(context, message, _failureIcon(context));
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
      _navigateTo(context, const AppScreen());
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = S.of(context).userNotFound;
      } else if (e.code == "email-already-in-use") {
        message = S.of(context).emailAlreadyInUse;
      } else {
        message = S.of(context).wrongEmailOrPassword;
      }
      _showAuthSnackBar(context, message, _failureIcon(context));
    }
  }

  static Future<void> logOut({required BuildContext context}) async {
    await _auth.signOut();
    await _googleAuth.signOut();
    if (!context.mounted) return;
    _navigateTo(context, const LogInScreen());
  }

  static Future<void> resetPassword(BuildContext context, String email) async {
    String message = '';
    try {
      await _auth.sendPasswordResetEmail(email: email);
      if (!context.mounted) return;
      message = S.of(context).emailWasSentSuccessfully;
      Navigator.pop(context);
      _showAuthSnackBar(context, message, _successIcon(context));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = S.of(context).userNotFound;
      } else if (e.code == "email-already-in-use") {
        message = S.of(context).emailAlreadyInUse;
      } else {
        message = S.of(context).someErrorOccurred;
      }
      _showAuthSnackBar(context, message, _failureIcon(context));
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

      if (await _isUserExist(googleUser!.email)) {
        await _firestore.collection(DatabaseCollections.usersCollection).add({
          "id": googleUser.id,
          "name": googleUser.displayName,
          "email": googleUser.email,
          "phoneNumber": null,
        });
      }

      if (!context.mounted) return null;
      _navigateTo(context, const AppScreen());

      return await _auth.signInWithCredential(credential);
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

      if (await _isUserExist(userData['email'])) {
        await _firestore.collection(DatabaseCollections.usersCollection).add({
          "id": userData['id'],
          "name": userData['name'],
          "email": userData['email'],
          "phoneNumber": null,
        });
      }

      if (!context.mounted) return null;
      _navigateTo(context, const AppScreen());

      return _auth.signInWithCredential(credential);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<void> signUpWithApple() async {}
}
