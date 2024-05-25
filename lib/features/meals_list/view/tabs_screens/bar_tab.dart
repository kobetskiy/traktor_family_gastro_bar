import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';

class BarTab extends StatefulWidget {
  const BarTab({super.key});

  @override
  State<BarTab> createState() => _BarTabState();
}

class _BarTabState extends State<BarTab> {
  final _mealsListBloc = MealsListBloc();

  @override
  void initState() {
    super.initState();
    _mealsListBloc
        .add(LoadAllMealsList(collection: DatabaseMealCategories.bar));
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
              collection: DatabaseMealCategories.bar);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
