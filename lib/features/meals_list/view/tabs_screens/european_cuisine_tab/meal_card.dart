import 'package:flutter/material.dart';

import 'meal_card_information.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.title,
    required this.cost,
    required this.likesCount,
    this.imageURL,
    this.subtitle,
    required this.grams,
  });

  final String title;
  final String? subtitle;
  final String? imageURL;
  final String cost;
  final String likesCount;
  final String grams;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealCardInformation(
              title: title,
              cost: cost,
              subtitle: subtitle,
              likesCount: likesCount,
              grams: '390',
            ),
            MealCardImage(imageURL: imageURL),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class MealCardInformation extends StatelessWidget {
  const MealCardInformation({
    super.key,
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

class MealCardImage extends StatelessWidget {
  const MealCardImage({
    super.key,
    required this.imageURL,
  });

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
