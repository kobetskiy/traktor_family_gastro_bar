import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meal_card/meal_card.dart';

class MealsListViewWidget extends StatelessWidget {
  const MealsListViewWidget({super.key, required this.state});

  final MealsListSuccess state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.data.length,
      itemBuilder: (_, int index) => MealCard(
        mealModel: MealModel(
          title: state.data[index]['title'],
          subtitle: state.data[index]['subtitle'],
          imageURL: state.data[index]['imageURL'],
          cost: state.data[index]['cost'],
          likesCount: state.data[index]['likesCount'],
          grams: state.data[index]['grams'],
        ),
      ),
      separatorBuilder: (_, __) => const Divider(height: 0),
    );
  }
}
