part of 'favorite_meals_bloc.dart';

sealed class FavoriteMealsState extends Equatable {
  const FavoriteMealsState();

  @override
  List<Object> get props => [];
}

final class FavoriteMealsInitial extends FavoriteMealsState {}

final class FavoriteMealsLoading extends FavoriteMealsState {}

final class FavoriteMealsSuccess extends FavoriteMealsState {
  const FavoriteMealsSuccess({required this.data});

  final List<Map<String, dynamic>> data;
}

final class FavoriteMealsFailure extends FavoriteMealsState {
  const FavoriteMealsFailure({required this.exception});

  final Object? exception;
}
