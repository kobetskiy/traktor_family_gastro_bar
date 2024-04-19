import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_service.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/exeptions.dart';

part 'meals_list_event.dart';
part 'meals_list_state.dart';

class MealsListBloc extends Bloc<MealsListEvent, MealsListState> {
  MealsListBloc() : super(MealsListInitial()) {
    on<LoadAllMealsList>((event, emit) async {
      try {
        emit(MealsListLoading());
        final databaseServise = DatabaseServise();
        final data = await databaseServise.getAllMeals(event.collection);
        if (data.docs.isEmpty) throw ServerExeption();
        emit(MealsListSuccess(data: data.docs));
      } catch (e) {
        emit(MealsListFailure(exception: e));
      }
    });

    on<LoadSearchedMealsList>((event, emit) async {
      try {
        emit(MealsListLoading());
        final databaseServise = DatabaseServise();
        final data = await databaseServise.getSearchedMeals(event.query);
        if (data.isEmpty) throw NoDataExeption();
        emit(MealsListSuccess(data: data));
      } catch (e) {
        emit(MealsListFailure(exception: e));
      }
    });
  }
}
