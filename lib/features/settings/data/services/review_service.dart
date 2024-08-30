import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/sending_result_screen.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ReviewService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> _sendReview(
      {required String text, required double rating}) async {
    await _firestore.collection(DatabaseCollections.reviewsCollection).add({
      'text': text,
      'rating': rating,
    });
  }

  Future<void> sendReviewToFirebase({
    required BuildContext context,
    required String text,
    required double rating,
  }) async {
    try {
      await _sendReview(text: text, rating: rating);
      if (!context.mounted) return;
      context.router.push(
        SendingResultRoute(
          title: S.of(context).thankYouForYourFeedback,
          subtitle: S.of(context).weTryToImproveOurServiceEveryDay,
        ),
      );
      rating = 0;
    } catch (e) {
      if (!context.mounted) return;
      context.router.push(
        SendingResultRoute(
          title: S.of(context).oopsSomethingWentWrong,
          subtitle: S.of(context).weAreAlreadyFixingThisBugPleaseTryAgainLater,
          isSuccess: false,
        ),
      );
    }
  }
}
