import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';


class EuropeanCuisineTab extends StatefulWidget {
  const EuropeanCuisineTab({super.key});

  @override
  State<EuropeanCuisineTab> createState() => _EuropeanCuisineTabState();
}

class _EuropeanCuisineTabState extends State<EuropeanCuisineTab> {
  final _mealsListBloc = MealsListBloc(collection: 'european-cuisine');

  @override
  void initState() {
    super.initState();
    _mealsListBloc.add(LoadMealsList());
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
          return ServerErrorWidget(mealsListBloc: _mealsListBloc);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
