import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_service.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/exeptions.dart';

part 'filtered_meals_list_event.dart';
part 'filtered_meals_list_state.dart';

class FilteredMealsListBloc
    extends Bloc<FilteredMealsListEvent, FilteredMealsListState> {
  FilteredMealsListBloc() : super(FilteredMealsListInitial()) {
    on<LoadFilteredMealsList>((event, emit) async {
      try {
        emit(FilteredMealsListLoading());
        final databaseServise = DatabaseServise();
        final data = await databaseServise.getFilteredMeals(event.filterField);
        if (data.docs.isEmpty) throw ServerExeption();
        emit(FilteredMealsListSuccess(data: data.docs));
      } catch (e) {
        emit(FilteredMealsListFailure(exception: e));
      }
    });
  }
}
