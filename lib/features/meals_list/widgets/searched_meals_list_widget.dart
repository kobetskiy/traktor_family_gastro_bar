import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/exeptions.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';

import 'index.dart';

class SearchedMealsListWidget extends StatefulWidget {
  const SearchedMealsListWidget({
    super.key,
    required this.controller,
    required this.bloc,
  });

  final TextEditingController controller;
  final MealsListBloc bloc;

  @override
  State<SearchedMealsListWidget> createState() =>
      _SearchedMealsListWidgetState();
}

class _SearchedMealsListWidgetState extends State<SearchedMealsListWidget> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(LoadSearchedMealsList(query: widget.controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsListBloc, MealsListState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state is MealsListSuccess) {
          return Expanded(child: MealsListViewWidget(state: state));
        }
        if (state is MealsListFailure) {
          if (state.exception is NoDataExeption) {
            return const NoDataWidget();
          } else if (state.exception is ServerExeption) {
            return const ServerErrorWidget(
              collection: DatabaseMealCategories.europeanCuisine,
            );
          }
        }
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
