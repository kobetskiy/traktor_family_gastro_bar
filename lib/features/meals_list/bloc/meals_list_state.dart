part of 'meals_list_bloc.dart';

@immutable
sealed class MealsListState extends Equatable {}

final class MealsListInitial extends MealsListState {
  @override
  List<Object?> get props => [];
}

final class MealsListLoading extends MealsListState {
  @override
  List<Object?> get props => [];
}

final class MealsListSuccess extends MealsListState {
  MealsListSuccess({required this.data});

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  
  @override
  List<Object?> get props => [data];
}

final class MealsListFailure extends MealsListState {
  MealsListFailure({required this.exception});

  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
}
