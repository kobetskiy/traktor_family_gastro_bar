import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/widgets/meal_details_screen.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class HomeMealsCard extends StatelessWidget {
  const HomeMealsCard({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFE1E1E1)
          : const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width: 155,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Column(
              children: [
                _HomeMealsCardImage(imageURL: mealModel.imageURL),
                const SizedBox(height: 7),
                _HomeMealsCardTitle(title: mealModel.title),
                const SizedBox(height: 2),
                _HomeMealsCardCost(cost: mealModel.cost)
              ],
            ),
          ),
        ),
        onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => MealDetailsScreen(mealModel: mealModel),
        ),
      ),
    );
  }
}

class _HomeMealsCardCost extends StatelessWidget {
  const _HomeMealsCardCost({required this.cost});

  final int cost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '$cost ${S.current.uah}',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _HomeMealsCardTitle extends StatelessWidget {
  const _HomeMealsCardTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _HomeMealsCardImage extends StatelessWidget {
  const _HomeMealsCardImage({required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: AspectRatio(
            aspectRatio: 1.33 / 1,
            child: CachedNetworkImage(
              imageUrl: imageURL,
              fit: BoxFit.fitWidth,
              progressIndicatorBuilder: (context, url, progress) =>
                  const AspectRatio(aspectRatio: 1.33 / 1),
            ),
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
              color: Colors.white,
              Icons.favorite_border_rounded,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
