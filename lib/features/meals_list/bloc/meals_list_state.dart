part of 'meals_list_bloc.dart';

@immutable
sealed class MealsListState {}

final class MealsListInitial extends MealsListState {}

final class MealsListLoading extends MealsListState {}

final class MealsListSuccess extends MealsListState {
  final QuerySnapshot<Map<String, dynamic>> data;
  MealsListSuccess({required this.data});

}

final class MealsListFailure extends MealsListState {
  MealsListFailure({required this.exception});

  final Object? exception;
}
