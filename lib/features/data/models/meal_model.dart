import 'package:cloud_firestore/cloud_firestore.dart';

class MealModel {
  final String title;
  final String subtitle;
  final String imageURL;
  final int cost;
  final int likesCount;
  final String grams;
  final String category;
  final Timestamp date;

  MealModel({
    required this.title,
    required this.cost,
    required this.likesCount,
    required this.grams,
    required this.imageURL,
    required this.subtitle,
    required this.category,
    required this.date,
  });
}
