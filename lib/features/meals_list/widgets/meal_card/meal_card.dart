import 'package:cached_network_image/cached_network_image.dart';
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
        builder: (_) => MealDetailsScreen(mealModel: mealModel),
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
  final String subtitle;
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
          subtitle != '' ? const SizedBox(height: 5) : const SizedBox.shrink(),
          subtitle != ''
              ? MealCardSubtitle(subtitle: subtitle)
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          Row(
            children: [
              InkWell(
                onTap: () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: MealCardLikes(likesCount: likesCount),
              ),
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

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: imageURL,
          key: UniqueKey(),
          fit: BoxFit.cover,
          placeholder: (_, __) => const ColoredBox(color: Colors.white12),
          errorWidget: (_, __, ___) => const SizedBox(
            height: 80.1,
            width: 106.7,
            child: ColoredBox(
              color: Colors.white12,
              child: Center(child: Icon(Icons.error)),
            ),
          ),
        ),
      ),
    );
  }
}
