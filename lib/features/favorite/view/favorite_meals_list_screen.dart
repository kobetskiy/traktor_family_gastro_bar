import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/features/favorite/bloc/favorite_meals_bloc.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/services/favorite_meals_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import '../widgets/favorite_meal_card/favorite_meal_card.dart';

class FavoriteMealsListScreen extends StatefulWidget {
  const FavoriteMealsListScreen({
    super.key,
    required this.state,
    required this.bloc,
  });

  final FavoriteMealsSuccess state;
  final FavoriteMealsBloc bloc;

  @override
  State<FavoriteMealsListScreen> createState() =>
      _FavoriteMealsListScreenState();
}

class _FavoriteMealsListScreenState extends State<FavoriteMealsListScreen> {
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
                itemBuilder: (_, int index) {
                  return FavoriteMealCard(
                    cartModel: CartMealModel(
                      id: widget.state.data[index][DatabaseMealFields.id],
                      title: widget.state.data[index][DatabaseMealFields.title],
                      imageURL: widget.state.data[index]
                          [DatabaseMealFields.imageURL],
                      cost: widget.state.data[index][DatabaseMealFields.cost],
                    ),
                    bloc: widget.bloc,
                  );
                },
                separatorBuilder: (_, __) => const Divider(height: 0),
              ),
              const WatermarkWidget(),
              const SizedBox(height: 130),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _BottomButtons(state: widget.state),
    );
  }
}

class _BottomButtons extends StatefulWidget {
  const _BottomButtons({required this.state});

  final FavoriteMealsSuccess state;

  @override
  State<_BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<_BottomButtons> {
  final favMealsService = FavoriteMealsService();

  int calculateTotalCost() {
    int totalCost = 0;
    for (var meal in widget.state.data) {
      totalCost += (meal[DatabaseMealFields.cost] as num).toInt();
    }
    return totalCost;
  }

  List<CartMealModel> getCartModelListFromState() {
    List<CartMealModel> cartModelsList = widget.state.data.map((meal) {
      return CartMealModel(
        id: meal[DatabaseMealFields.id],
        title: meal[DatabaseMealFields.title],
        imageURL: meal[DatabaseMealFields.imageURL],
        cost: meal[DatabaseMealFields.cost],
      );
    }).toList();
    return cartModelsList;
  }

  Future<void> orderDelivery() async {
    if (calculateTotalCost() < 300) {
      Constants.showSnackBar(
        context,
        "Мінімальна сума для доставки повинна бути 300 грн",
        Constants.failureIcon(context),
      );
    } else {
      context.router.push(
        DeliverRoute(cartModelsList: getCartModelListFromState()),
      );
    }
  }

  Future<void> orderReservation() async {
    context.router.push(
      ReserveRoute(cartModelsList: getCartModelListFromState()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 110,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            "${S.of(context).totalCost(calculateTotalCost())} ${S.of(context).uah}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PrimaryButton.outlined(
                  onPressed: orderReservation,
                  child: Text(S.of(context).reserve),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: PrimaryButton(
                  onPressed: orderDelivery,
                  child: Text(S.of(context).deliver),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
