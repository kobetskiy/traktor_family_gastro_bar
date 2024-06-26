import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/meal_card/meal_card_information.dart';
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
                child: Text(mealModel.title, style: AppTextStyles.titleLarge),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '${mealModel.cost} ${S.current.uah}',
                  style: AppTextStyles.titleLarge
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
                  style: AppTextStyles.subtitle
                      .copyWith(color: AppColors.subtitleColor),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 15),
          Row(
            children: [
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
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
        progressIndicatorBuilder: (context, url, progress) => const AspectRatio(aspectRatio: 1.33 / 1),
        errorWidget: (_, __, ___) => AspectRatio(
          aspectRatio: 1.33 / 1,
          child: ColoredBox(
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).thePictureIsTemporarilyUnavailable,
                    style: AppTextStyles.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).weAreAlreadyWorkingOnASolutionToThisProblem,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.subtitleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
