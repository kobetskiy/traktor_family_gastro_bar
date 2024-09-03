import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';

import 'favorite_meal_card_information.dart';

class FavoriteMealCard extends StatelessWidget {
  const FavoriteMealCard({super.key, required this.cartModel});

  final CartMealModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _MealCardImage(imageURL: cartModel.imageURL),
          const SizedBox(width: 20),
          _MealCardInformation(
            title: cartModel.title,
            cost: cartModel.cost.toString(),
          ),
        ],
      ),
    );
  }
}

class _MealCardInformation extends StatelessWidget {
  const _MealCardInformation({required this.title, required this.cost});

  final String title;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealCardTitle(title: title),
          const SizedBox(height: 5),
          MealCardCost(cost: cost),
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
      flex: 2,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 120),
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
      ),
    );
  }
}
