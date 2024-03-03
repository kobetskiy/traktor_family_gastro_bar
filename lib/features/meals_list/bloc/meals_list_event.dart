part of 'meals_list_bloc.dart';

@immutable
sealed class MealsListEvent extends Equatable {}

class LoadAllMealsList extends MealsListEvent {
  LoadAllMealsList({required this.collection});

  final String collection;
  
  @override
  List<Object?> get props => [collection];
}

class LoadSearchedMealsList extends MealsListEvent {
  LoadSearchedMealsList({required this.query});

  final String query;
  
  @override
  List<Object?> get props => [query];
}
