import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/meals_card_service.dart';
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

class _Information extends StatefulWidget {
  const _Information({required this.mealModel});

  final MealModel mealModel;

  @override
  State<_Information> createState() => _InformationState();
}

class _InformationState extends State<_Information> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Text(widget.mealModel.title,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '${widget.mealModel.cost} ${S.current.uah}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
          widget.mealModel.subtitle != ''
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          widget.mealModel.subtitle != ''
              ? Text(
                  widget.mealModel.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey[600]),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 15),
          Row(
            children: [
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                onTap: toggleFavorites,
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
        progressIndicatorBuilder: (context, url, progress) =>
            const AspectRatio(aspectRatio: 1.33 / 1),
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
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).weAreAlreadyWorkingOnASolutionToThisProblem,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey[600],
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
