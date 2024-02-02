import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/meal_details_screen/meal_details_screen.dart';

import 'meal_card_information.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MealCardInformation(
              title: mealModel.title,
              cost: mealModel.cost,
              subtitle: mealModel.subtitle,
              likesCount: mealModel.likesCount,
              grams: mealModel.grams,
            ),
            _MealCardImage(imageURL: mealModel.imageURL),
          ],
        ),
      ),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => MealDetailsScreen(mealModel: mealModel),
      ),
    );
  }
}

class _MealCardInformation extends StatelessWidget {
  const _MealCardInformation({
    required this.title,
    required this.cost,
    required this.subtitle,
    required this.likesCount,
    required this.grams,
  });

  final String title;
  final String cost;
  final String? subtitle;
  final String likesCount;
  final String grams;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealCardTitle(title: title),
          const SizedBox(height: 5),
          MealCardCost(cost: cost),
          subtitle != null
              ? const SizedBox(height: 5)
              : const SizedBox.shrink(),
          subtitle != null
              ? MealCardSubtitle(subtitle: subtitle)
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          Row(
            children: [
              MealCardLikes(likesCount: likesCount),
              const SizedBox(width: 15),
              MealCardGrams(grams: grams)
            ],
          )
        ],
      ),
    );
  }
}

class _MealCardImage extends StatelessWidget {
  const _MealCardImage({required this.imageURL});

  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageURL ??
              'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/zExBcGl-uoPjKNI-doWEOQD.jpeg',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
