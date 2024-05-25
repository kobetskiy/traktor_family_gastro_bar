import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/bloc/filtered_meals_list_bloc/filtered_meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/home_meals_card/home_meals_list_view.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/shimmer_affect_widgets/home_meals_shimmer_loading.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/server_error_widget.dart';

class HomeMealsPresentation extends StatefulWidget {
  const HomeMealsPresentation({super.key, required this.filterField});

  final String filterField;

  @override
  State<HomeMealsPresentation> createState() => _HomeMealsPresentationState();
}

class _HomeMealsPresentationState extends State<HomeMealsPresentation> {
  final _bloc = FilteredMealsListBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadFilteredMealsList(filterField: widget.filterField));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredMealsListBloc, FilteredMealsListState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is FilteredMealsListSuccess) {
          return HomeMealsListView(state: state);
        }
        if (state is FilteredMealsListFailure) {
          return const ServerErrorWidget();
        }
        return const HomeMealsShimmerLoading();
      },
    );
  }
}
