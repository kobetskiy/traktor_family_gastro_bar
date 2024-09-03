import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/home/bloc/filtered_meals_list_bloc/filtered_meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/home/widgets/home_meals_card/home_meals_card.dart';

class HomeMealsListView extends StatelessWidget {
  const HomeMealsListView({super.key, required this.state});

  final FilteredMealsListSuccess state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 7,
        itemBuilder: (_, int index) {
          return HomeMealsCard(
            mealModel: MealModel(
              id: state.data[index][DatabaseMealFields.id],
              title: state.data[index][DatabaseMealFields.title],
              subtitle: state.data[index][DatabaseMealFields.subtitle],
              imageURL: state.data[index][DatabaseMealFields.imageURL],
              cost: state.data[index][DatabaseMealFields.cost],
              likesCount: state.data[index][DatabaseMealFields.likesCount],
              grams: state.data[index][DatabaseMealFields.grams],
              category: state.data[index][DatabaseMealFields.category],
              date: state.data[index][DatabaseMealFields.date],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}
