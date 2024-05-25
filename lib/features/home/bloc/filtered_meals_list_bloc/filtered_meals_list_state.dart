part of 'filtered_meals_list_bloc.dart';

@immutable
sealed class FilteredMealsListState extends Equatable {}

final class FilteredMealsListInitial extends FilteredMealsListState {
  @override
  List<Object?> get props => [];
}

final class FilteredMealsListLoading extends FilteredMealsListState {
  @override
  List<Object?> get props => [];
}

final class FilteredMealsListSuccess extends FilteredMealsListState {
  FilteredMealsListSuccess({required this.data});

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  
  @override
  List<Object?> get props => [data];
}

final class FilteredMealsListFailure extends FilteredMealsListState {
  FilteredMealsListFailure({required this.exception});

  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
}
