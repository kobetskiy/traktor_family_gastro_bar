import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/meals_card_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/meal_details_screen.dart';

import 'meal_card_information.dart';

class MealCard extends StatefulWidget {
  const MealCard({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MealCardInformation(mealModel: widget.mealModel),
            _MealCardImage(imageURL: widget.mealModel.imageURL),
          ],
        ),
      ),
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => MealDetailsScreen(mealModel: widget.mealModel),
        );
      },
    );
  }
}

class _MealCardInformation extends StatefulWidget {
  const _MealCardInformation({required this.mealModel});

  final MealModel mealModel;

  @override
  State<_MealCardInformation> createState() => _MealCardInformationState();
}

class _MealCardInformationState extends State<_MealCardInformation> {
  final mealsCardService = MealsCardService();

  void toggleFavorites() async {
    await mealsCardService.toggleFavorites(
      context,
      widget.mealModel.toCartMealModel(),
    );
    await mealsCardService.getFavoriteMealsIds();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealCardTitle(title: widget.mealModel.title),
          const SizedBox(height: 5),
          MealCardCost(cost: widget.mealModel.cost),
          widget.mealModel.subtitle != ''
              ? const SizedBox(height: 5)
              : const SizedBox.shrink(),
          widget.mealModel.subtitle != ''
              ? MealCardSubtitle(subtitle: widget.mealModel.subtitle)
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // getLikesCount();
                  toggleFavorites();
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: MealCardLikes(mealModel: widget.mealModel),
              ),
              const SizedBox(width: 15),
              MealCardGrams(grams: widget.mealModel.grams)
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
