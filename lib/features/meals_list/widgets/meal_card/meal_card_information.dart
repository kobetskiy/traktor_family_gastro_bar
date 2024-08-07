import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealCardTitle extends StatelessWidget {
  const MealCardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleSmall);
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

  final int cost;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${checkCost(cost.toString())} ${S.of(context).uah}',
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: Theme.of(context).primaryColor),
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

  final int likesCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey[600]!)),
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
                child: Text(
                  likesCount.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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
      grams.isNotEmpty ? grams + S.of(context).gramsSymbol : '',
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: Colors.grey[600]),
    );
  }
}
