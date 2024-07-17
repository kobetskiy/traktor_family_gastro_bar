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
          Text(text),
        ],
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => page),
      (route) => false,
    );
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
      await _firestore.collection(DatabaseCollections.usersCollection).add({
        "uid": _auth.currentUser!.uid,
        "name": _auth.currentUser!.displayName,
        "email": _auth.currentUser!.email,
        "phoneNumber": _auth.currentUser!.phoneNumber,
      });
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'email-already-in-use') {
        message = 'This email is already taken';
      } else if (e.code == 'invalid-email') {
        message = 'Enter valid email';
      } else if (e.code == 'weak-password') {
        message = 'Password is not strong enough';
      } else {
        message = 'Some error occurred';
      }
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
        message = 'User not found';
      } else if (e.code == "email-already-in-use") {
        message = "Email already in use";
      } else {
        message = "Wrong email or password";
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

  static Future<void> updateName(User user, String name) async {
    await user.updateDisplayName(name);
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
        message = "User not found";
      } else if (e.code == "email-already-in-use") {
        message = "Email already in use";
      } else {
        message = 'Some error occurred';
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
