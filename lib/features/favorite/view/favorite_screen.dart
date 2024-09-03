import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/favorite/bloc/favorite_meals_bloc.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/favorite_meals_list_screen.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/no_data_found_widget.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/favorite_meal_shimmer.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final _favMealsBloc = FavoriteMealsBloc();

  @override
  void initState() {
    super.initState();
    _favMealsBloc.add(LoadFavoriteMeals());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteMealsBloc, FavoriteMealsState>(
      bloc: _favMealsBloc,
      builder: (context, state) {
        if (state is FavoriteMealsSuccess) {
          return FavoriteMealsListScreen(state: state);
        }
        if (state is FavoriteMealsFailure) {
          return const NoDataFoundWidget();
        }
        return const FavoriteMealShimmer();
      },
    );
  }
}
