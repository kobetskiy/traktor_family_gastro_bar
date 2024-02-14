import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/exeptions.dart';

part 'meals_list_event.dart';
part 'meals_list_state.dart';

class MealsListBloc extends Bloc<MealsListEvent, MealsListState> {
  final String collection;

  MealsListBloc({required this.collection}) : super(MealsListInitial()) {
    on<LoadMealsList>((event, emit) async {
      try {
        emit(MealsListLoading());
        final data = await FirebaseFirestore.instance
            .collection(collection)
            .get();
        if (data.docs.isEmpty) throw ServerExeption();
        emit(MealsListSuccess(data: data));
      } catch (e) {
        emit(MealsListFailure(exception: e));
      }
    });
  }
}
