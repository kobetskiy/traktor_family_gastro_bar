import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/auth/view/auth_screens.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

abstract class AuthService {
  static final _auth = FirebaseAuth.instance;
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
      updateName(_auth.currentUser!, name);
      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const AppScreen()),
        (route) => false,
      );
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
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const AppScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'User not found';
      } else {
        message = "Wrong email or password";
      }
      _showAuthSnackBar(context, message, _failureIcon(context));
    }
  }

  static Future<void> logOut({required BuildContext context}) async {
    await _auth.signOut();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const LogInScreen()),
      (route) => false,
    );
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
      _showAuthSnackBar(context, message, _successIcon(context));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = "User not found";
      } else {
        message = 'Some error occurred';
      }
    }
  }
}
