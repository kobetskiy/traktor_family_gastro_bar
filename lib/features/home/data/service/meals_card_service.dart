import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealsCardService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _isUserLoggedIn = FirebaseAuth.instance.currentUser != null;

  Future<bool> isMealInFavorites(CartMealModel cartMeal) async {
    final userData = _firestore
        .collection(DatabaseCollections.users)
        .doc(_auth.currentUser!.email);

    final userDocSnapshot = await userData.get();
    final List favoritesMeals = userDocSnapshot.get('favoritesMeals') ?? [];
    final isInFavorites =
        favoritesMeals.any((meal) => meal['id'] == cartMeal.id);

    return isInFavorites;
  }

  Future<void> toggleFavorites(
    BuildContext context,
    CartMealModel cartMeal,
  ) async {
    if (await isMealInFavorites(cartMeal)) {
      if (!context.mounted) return;
      await _removeFromFavorite(context, cartMeal);
    } else {
      if (!context.mounted) return;
      await _addToFavorite(context, cartMeal);
    }
  }

  Future<List<String>> getFavoriteMealsIds() async {
    List<String> mealIds = [];
    final userDoc = await _firestore
        .collection(DatabaseCollections.users)
        .doc(_auth.currentUser!.email)
        .get();

    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>;

      final favoritesMeals = userData['favoritesMeals'];

      for (Map<String, dynamic> meal in favoritesMeals) {
        if (meal.containsKey('id')) mealIds.add(meal['id']);
      }
    }
    return mealIds;
  }

  Future<void> _addFavoriteMealToFirebase(CartMealModel cartMeal) async {
    // adding new favorite meal to firestore
    await _firestore
        .collection(DatabaseCollections.users)
        .doc(_auth.currentUser!.email)
        .update({
      'favoritesMeals': FieldValue.arrayUnion([cartMeal.toMap()]),
    });

    // incrementing meal likes count
    await _firestore
        .collection(DatabaseCollections.meals)
        .doc(cartMeal.id)
        .update({
      DatabaseMealFields.likesCount: FieldValue.increment(1),
    });
  }

  Future<void> _removeFavoriteMealFromFirebase(CartMealModel cartMeal) async {
    // deleting favorite meal from firestore
    await _firestore
        .collection(DatabaseCollections.users)
        .doc(_auth.currentUser!.email)
        .update({
      'favoritesMeals': FieldValue.arrayRemove([cartMeal.toMap()]),
    });

    // decrementing meal likes count
    await _firestore
        .collection(DatabaseCollections.meals)
        .doc(cartMeal.id)
        .update({
      DatabaseMealFields.likesCount: FieldValue.increment(-1),
    });
  }

  Future<void> _removeFromFavorite(
    BuildContext context,
    CartMealModel cartMeal,
  ) async {
    try {
      await _removeFavoriteMealFromFirebase(cartMeal);
      if (!context.mounted) return;
      Constants.showSnackBar(
          context,
          S.of(context).mealTitleHasBeenRemovedFromFavorites(cartMeal.title),
          Constants.successIcon(context));
    } on Exception catch (e) {
      Constants.showSnackBar(
        context,
        S.of(context).someErrorOccurred,
        Constants.failureIcon(context),
      );
      log(e.toString());
    }
  }

  Future<void> _addToFavorite(
    BuildContext context,
    CartMealModel cartMeal,
  ) async {
    try {
      if (_isUserLoggedIn) {
        await _addFavoriteMealToFirebase(cartMeal);
        if (!context.mounted) return;
        Constants.showSnackBar(
            context,
            S.of(context).mealTitleAddedToFavorites(cartMeal.title),
            Constants.successIcon(context));
      } else {
        Constants.showAlertDialog(
          context: context,
          title: S.of(context).youAreNotAuthorized,
          content: S.of(context).youMustBeLoggedInToAddThisDishTo,
          actions: [
            TextButton(
              onPressed: context.router.maybePop,
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () => context.router.popAndPush(const LogInRoute()),
              child: Text(S.of(context).logIn),
            )
          ],
        );
      }
    } on Exception catch (e) {
      Constants.showSnackBar(
        context,
        S.of(context).someErrorOccurred,
        Constants.failureIcon(context),
      );
      log(e.toString());
    }
  }
}
