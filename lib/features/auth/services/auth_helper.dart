import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';

mixin AuthHelper {
  static final _firestore = FirebaseFirestore.instance;

  static Future<bool> isUserExist(String? email) async {
    final querySnapshot = await _firestore
        .collection(DatabaseCollections.users)
        .where("email", isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> updateUserField(
      User user, String fieldName, String fieldValue) async {
    final userCollection = _firestore.collection(
      DatabaseCollections.users,
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
      await _firestore.collection(DatabaseCollections.users).doc(email).set({
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "favoritesMeals": []
      });
    }
  }
}
