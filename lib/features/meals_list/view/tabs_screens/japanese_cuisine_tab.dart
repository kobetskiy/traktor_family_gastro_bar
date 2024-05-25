import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';

class JapaneseCuisineTab extends StatefulWidget {
  const JapaneseCuisineTab({super.key});

  @override
  State<JapaneseCuisineTab> createState() => _JapaneseCuisineTabState();
}

class _JapaneseCuisineTabState extends State<JapaneseCuisineTab> {
  final _mealsListBloc = MealsListBloc();

  @override
  void initState() {
    super.initState();
    _mealsListBloc.add(
        LoadAllMealsList(collection: DatabaseMealCategories.japaneseCuisine));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsListBloc, MealsListState>(
      bloc: _mealsListBloc,
      builder: (context, state) {
        if (state is MealsListSuccess) {
          return MealsListViewWidget(state: state);
        }
        if (state is MealsListFailure) {
          return const ServerErrorWidget(
              collection: DatabaseMealCategories.japaneseCuisine);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
