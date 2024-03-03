import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meal_card/meal_card_information.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Image(mealModel: mealModel),
          const SizedBox(height: 10),
          _Information(mealModel: mealModel)
        ],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information({required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Text(mealModel.title,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '${mealModel.cost} ${S.current.uah}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          mealModel.subtitle != ''
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          mealModel.subtitle != ''
              ? Text(
                  mealModel.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.subtitleColor),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 15),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: MealCardLikes(likesCount: mealModel.likesCount),
              ),
              const SizedBox(width: 15),
              MealCardGrams(grams: mealModel.grams)
            ],
          )
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CachedNetworkImage(
        imageUrl: mealModel.imageURL,
        key: UniqueKey(),
        fit: BoxFit.cover,
        placeholder: (_, __) => const ColoredBox(color: Colors.white12),
        errorWidget: (_, __, ___) => const SizedBox(
          height: 270.1,
          width: 360,
          child: ColoredBox(
            color: Colors.white12,
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
