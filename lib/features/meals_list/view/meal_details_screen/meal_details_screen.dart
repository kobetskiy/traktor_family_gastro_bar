import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/models/meal_model.dart';
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
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(mealModel.imageURL ??
                'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/sCQGZhk-IEZJXnx-henbgqF.jpeg'),
          ),
          const SizedBox(height: 10),
          Padding(
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
                mealModel.subtitle != null
                    ? const SizedBox(height: 10)
                    : const SizedBox.shrink(),
                Text(
                  mealModel.subtitle ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.subtitleColor),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    MealCardLikes(likesCount: mealModel.likesCount),
                    const SizedBox(width: 15),
                    MealCardGrams(grams: mealModel.grams)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
