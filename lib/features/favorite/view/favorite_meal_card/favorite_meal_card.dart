import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'favorite_meal_card_information.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MealCardInformation(
            title: 'Скрембл з авокадо та хамоном',
            cost: '235',
          ),
          _MealCardImage(
              imageURL:
                  'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/sCQGZhk-IEZJXnx-henbgqF.jpeg'),
        ],
      ),
    );
  }
}

class _MealCardInformation extends StatelessWidget {
  const _MealCardInformation({
    required this.title,
    required this.cost,
  });

  final String title;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealCardTitle(title: title),
          const SizedBox(height: 10),
          Row(
            children: [
              MealCardCost(cost: cost),
              const SizedBox(width: 35),
              const MealCardCount(),
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
