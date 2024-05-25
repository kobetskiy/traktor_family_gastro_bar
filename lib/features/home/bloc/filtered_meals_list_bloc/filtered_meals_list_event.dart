part of 'filtered_meals_list_bloc.dart';

@immutable
sealed class FilteredMealsListEvent extends Equatable {}

class LoadFilteredMealsList extends FilteredMealsListEvent {
  LoadFilteredMealsList({required this.filterField});

  final String filterField;

  @override
  List<Object?> get props => [filterField];
}
