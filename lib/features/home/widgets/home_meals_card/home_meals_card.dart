import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class HomeMealsCard extends StatelessWidget {
  const HomeMealsCard({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 155,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white12,
          ),
          child: Column(
            children: [
              _HomeMealsCardImage(mealModel: mealModel),
              const SizedBox(height: 10),
              _HomeMealsCardTitle(mealModel: mealModel),
              const SizedBox(height: 4),
              _HomeMealsCardCost(mealModel: mealModel)
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeMealsCardCost extends StatelessWidget {
  const _HomeMealsCardCost({required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '${mealModel.cost} ${S.current.uah}',
        style: AppTextStyles.titleSmall.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}

class _HomeMealsCardTitle extends StatelessWidget {
  const _HomeMealsCardTitle({required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        mealModel.title,
        style: AppTextStyles.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _HomeMealsCardImage extends StatelessWidget {
  const _HomeMealsCardImage({required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Image.network(
            mealModel.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          top: -5,
          right: -5,
          child: SizedBox(
            width: 60,
            height: 60,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color(0xCC000000), Color(0x00000000)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.favorite_border_rounded,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}