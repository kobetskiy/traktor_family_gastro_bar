import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/database/collections.dart';
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
    _mealsListBloc
        .add(LoadAllMealsList(collection: Collections.japaneseCuisine));
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
              collection: Collections.japaneseCuisine);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
