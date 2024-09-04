import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';

class FavoriteMealsService {
  Future<List<Map<String, dynamic>>> getFavoritesMeals() async {
    try {
      final auth = FirebaseAuth.instance;

      final userData = await FirebaseFirestore.instance
          .collection(DatabaseCollections.users)
          .doc(auth.currentUser?.email)
          .get();

      final result = List<Map<String, dynamic>>.from(
        userData.get('favoritesMeals'),
      );
      return result;
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> reserveMeals() async {}
  
  Future<void> deliverMeals() async {}
}
