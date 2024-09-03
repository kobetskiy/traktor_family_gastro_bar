part of 'favorite_meals_bloc.dart';

sealed class FavoriteMealsEvent extends Equatable {
  const FavoriteMealsEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteMeals extends FavoriteMealsEvent {}
