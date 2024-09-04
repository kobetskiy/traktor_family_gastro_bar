import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:traktor_family_gastro_bar/features/favorite/bloc/favorite_meals_bloc.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/meals_card_service.dart';

import 'favorite_meal_card_information.dart';

class FavoriteMealCard extends StatefulWidget {
  const FavoriteMealCard({
    super.key,
    required this.cartModel,
    required this.bloc,
  });

  final CartMealModel cartModel;
  final FavoriteMealsBloc bloc;

  @override
  State<FavoriteMealCard> createState() => _FavoriteMealCardState();
}

class _FavoriteMealCardState extends State<FavoriteMealCard> {
  final mealsCardService = MealsCardService();
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.35,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              await mealsCardService.toggleFavorites(context, widget.cartModel);
              widget.bloc.add(LoadFavoriteMeals());
            },
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        horizontalTitleGap: 25,
        contentPadding: const EdgeInsets.fromLTRB(30, 8, 20, 8),
        leading: _MealCardImage(imageURL: widget.cartModel.imageURL),
        title: MealCardTitle(title: widget.cartModel.title),
        subtitle: MealCardCost(cost: widget.cartModel.cost.toString()),
      ),
    );
  }
}

class _MealCardImage extends StatelessWidget {
  const _MealCardImage({required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.25,
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
