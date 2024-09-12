import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';

class FavoriteMealsService {
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> getFavoritesMeals() async {
    try {
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

  Future<void> loadUserData(
    TextEditingController nameController,
    TextEditingController phoneController,
  ) async {
    if (auth.currentUser != null) {
      final userData = await AuthService.getUserData();
      if (userData != null) {
        nameController.text = userData.name;
        phoneController.text = userData.phoneNumber?.substring(4) ?? '';
      }
    }
  }

  Future<void> updatePersonalInformationIfItChanged(
      String name, String phone) async {
    final userInfo = await AuthService.getUserData();
    final newName = name;
    final newPhone = phone;

    if (newName != userInfo?.name || newPhone != userInfo?.phoneNumber) {
      await AuthService.updatePersonalInformation(newName, newPhone);
    }
  }

  Future<void> reserveMeals({
    required BuildContext context,
    required List<CartMealModel> cartModelsList,
    required String reservationDate,
    required String reservationTime,
    required String reservationDuration,
    required String numberOfGuests,
    required String comment,
  }) async {
    final userData = await AuthService.getUserData();
    final orderedMeals = cartModelsList.map((meal) => meal.toMap()).toList();
    await _firestore.collection(DatabaseCollections.reserves).add({
      "orderedAt": Timestamp.now(),
      "userName": userData?.name,
      "userEmail": userData?.email,
      "userPhoneNumber": userData?.phoneNumber,
      "orderedMeals": orderedMeals,
      "reservationDate": reservationDate,
      "reservationTime": reservationTime,
      "reservationDuration": reservationDuration,
      "numberOfGuests": numberOfGuests,
      "comment": comment,
    });
  }

  Future<void> deliverMeals({
    required BuildContext context,
    required List<CartMealModel> cartModelsList,
    required String address,
    String? commentToAddess,
    String? tip,
  }) async {
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
}
