import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/database/collections.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';

class HookahTab extends StatefulWidget {
  const HookahTab({super.key});

  @override
  State<HookahTab> createState() => _HookahTabState();
}

class _HookahTabState extends State<HookahTab> {
  final _mealsListBloc = MealsListBloc();

  @override
  void initState() {
    super.initState();
    _mealsListBloc.add(LoadAllMealsList(collection: Collections.hookah));
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
          return const ServerErrorWidget(collection: Collections.hookah);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
