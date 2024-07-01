import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';

class ReviewService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> sendReview({
    required String text,
    required double rating
  }) async {
    await _firestore.collection(DatabaseCollections.reviewsCollection).add({
      'text': text,
      'rating': rating,
    });
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}