import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/features/auth/view/auth_screens.dart';

abstract class AuthService {
  static final _auth = FirebaseAuth.instance;

  static showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      content: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
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
      if (e.code == 'email-already-in-use') {
        message = 'This email is already taken';
      } else if (e.code == 'invalid-email') {
        message = 'Enter valid email';
      } else if (e.code == 'weak-password') {
        message = 'Password is not strong enough';
      } else {
        message = 'Some error occurred';
      }
      showSnackBar(context, message);
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
      showSnackBar(context, message);
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
}
