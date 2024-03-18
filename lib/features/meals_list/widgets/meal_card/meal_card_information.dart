import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealCardTitle extends StatelessWidget {
  const MealCardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyMedium);
  }
}

String checkCost(String cost) {
  String result = '';
  result = int.tryParse(cost).toString();
  if (result == 'null') result = '';
  return result;
}

class MealCardCost extends StatelessWidget {
  const MealCardCost({super.key, required this.cost});

  final String cost;

  @override
  Widget build(BuildContext context) {
    return Text(
      checkCost(cost).isEmpty
          ? cost
          : '${checkCost(cost)} ${S.of(context).uah}',
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColors.primaryColor),
    );
  }
}

class MealCardSubtitle extends StatelessWidget {
  const MealCardSubtitle({super.key, required this.subtitle});

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle ?? '',
      style: Theme.of(context).textTheme.bodySmall,
      maxLines: 3,
      overflow: TextOverflow.fade,
    );
  }
}

class MealCardLikes extends StatelessWidget {
  const MealCardLikes({super.key, required this.likesCount});

  final String likesCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.subtitleColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.favorite_border_rounded),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Center(
                child: Text(likesCount),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MealCardGrams extends StatelessWidget {
  const MealCardGrams({super.key, required this.grams});

  final String grams;

  @override
  Widget build(BuildContext context) {
    return Text(
      grams.isNotEmpty
          ? grams + S.of(context).gramsSymbol
          : '',
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: AppColors.subtitleColor),
    );
  }
}
