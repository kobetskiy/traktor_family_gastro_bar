import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';

mixin AuthHelper {
  static final _firestore = FirebaseFirestore.instance;

  static Icon failureIcon(BuildContext context) => Icon(
        Icons.error_outline_rounded,
        color: Theme.of(context).colorScheme.error,
      );

  static Icon successIcon(BuildContext context) => Icon(
        Icons.check_circle_outline_rounded,
        color: Theme.of(context).colorScheme.success,
      );

  static showAuthSnackBar(BuildContext context, String text, Icon icon) {
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

  static Future<bool> isUserExist(String? email) async {
    final querySnapshot = await _firestore
        .collection(DatabaseCollections.usersCollection)
        .where("email", isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> updateUserField(
      User user, String fieldName, String fieldValue) async {
    final userCollection = _firestore.collection(
      DatabaseCollections.usersCollection,
    );
    final querySnapshot =
        await userCollection.where('email', isEqualTo: user.email).get();

    if (querySnapshot.docs.isNotEmpty) {
      final docId = querySnapshot.docs.first.id;
      await userCollection.doc(docId).update({fieldName: fieldValue});
    }
  }

  static Future<void> addUserDataToFirestore({
    required String id,
    required String? name,
    required String? email,
    String? phoneNumber,
  }) async {
    if (!await AuthHelper.isUserExist(email)) {
      await _firestore
          .collection(DatabaseCollections.usersCollection)
          .doc(email)
          .set({
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
      });
    }
  }
}
