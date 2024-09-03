import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:traktor_family_gastro_bar/features/data/exeptions.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/services/favorite_meals_service.dart';

part 'favorite_meals_event.dart';
part 'favorite_meals_state.dart';

class FavoriteMealsBloc extends Bloc<FavoriteMealsEvent, FavoriteMealsState> {
  FavoriteMealsBloc() : super(FavoriteMealsInitial()) {
    on<LoadFavoriteMeals>((event, emit) async {
      try {
        emit(FavoriteMealsLoading());
        final favMealsServise = FavoriteMealsService();
        final data = await favMealsServise.getFavoritesMeals();
        if (data.isEmpty) throw NoDataExeption();
        emit(FavoriteMealsSuccess(data: data));
      } catch (e) {
        emit(FavoriteMealsFailure(exception: e));
      }
    });
  }
}
