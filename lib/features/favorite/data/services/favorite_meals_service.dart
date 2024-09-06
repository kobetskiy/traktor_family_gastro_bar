import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';

class FavoriteMealsService {
  static final _firestore = FirebaseFirestore.instance;

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

  static Future<void> addDeliveryDataToFirestore(
      {required List<CartMealModel> cartModelsList,
      required String address,
      String? commentToAddess,
      String? tip}) async {
    final userData = await AuthService.getUserData();
    final orderedMeals = cartModelsList.map((meal) => meal.toMap()).toList();
    await _firestore.collection(DatabaseCollections.deliveries).add({
      "orderedAt": Timestamp.now(),
      "userName": userData?.name,
      "userEmail": userData?.email,
      "userPhoneNumber": userData?.phoneNumber,
      "orderedMeals": orderedMeals,
      "address": address,
      "commentToAddess": commentToAddess,
      'tip': tip
    });
  }

  Future<void> reserveMeals(BuildContext context) async {}

  Future<void> deliverMeals({
    required BuildContext context,
    required List<CartMealModel> cartModelsList,
    required String address,
    String? commentToAddess,
    String? tip,
  }) async {
    await addDeliveryDataToFirestore(
      cartModelsList: cartModelsList,
      address: address,
      commentToAddess: commentToAddess,
      tip: tip,
    );
  }
}
