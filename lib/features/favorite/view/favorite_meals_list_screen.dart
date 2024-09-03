import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/favorite/bloc/favorite_meals_bloc.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import '../widgets/favorite_meal_card/favorite_meal_card.dart';

class FavoriteMealsListScreen extends StatefulWidget {
  const FavoriteMealsListScreen({super.key, required this.state});

  final FavoriteMealsSuccess state;

  @override
  State<FavoriteMealsListScreen> createState() =>
      _FavoriteMealsListScreenState();
}

class _FavoriteMealsListScreenState extends State<FavoriteMealsListScreen> {
  int calculateTotalCost() {
    int totalCost = 0;
    for (var meal in widget.state.data) {
      totalCost += (meal[DatabaseMealFields.cost] as num).toInt();
    }
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).favorites),
          ],
          body: ListView(
            children: [
              ListView.separated(
                itemCount: widget.state.data.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (_, int index) => FavoriteMealCard(
                  cartModel: CartMealModel(
                    id: widget.state.data[index][DatabaseMealFields.id],
                    title: widget.state.data[index][DatabaseMealFields.title],
                    imageURL: widget.state.data[index]
                        [DatabaseMealFields.imageURL],
                    cost: widget.state.data[index][DatabaseMealFields.cost],
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(height: 0),
              ),
              const WatermarkWidget(),
              const SizedBox(height: 130),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 110,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              "Всього: ${calculateTotalCost().toString()} грн",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PrimaryButton.outlined(
                    onPressed: () {},
                    child: Text(S.of(context).reserve),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {},
                    child: Text(S.of(context).deliver),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
