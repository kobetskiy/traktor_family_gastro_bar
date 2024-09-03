import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';

class MealModel {
  final String id;
  final String title;
  final String subtitle;
  final String imageURL;
  final int cost;
  final int likesCount;
  final String grams;
  final String category;
  final Timestamp date;

  MealModel({
    required this.id,
    required this.title,
    required this.cost,
    required this.likesCount,
    required this.grams,
    required this.imageURL,
    required this.subtitle,
    required this.category,
    required this.date,
  });

  CartMealModel toCartMealModel() {
    return CartMealModel(id: id, title: title, cost: cost, imageURL: imageURL);
  }
}
