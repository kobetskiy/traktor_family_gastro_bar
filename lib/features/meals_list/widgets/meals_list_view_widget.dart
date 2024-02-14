
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meal_card/meal_card.dart';

class MealsListViewWidget extends StatelessWidget {
  const MealsListViewWidget({
    super.key,
    required this.state,
  });

  final MealsListSuccess state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.data.size,
      itemBuilder: (BuildContext context, int index) => MealCard(
        mealModel: MealModel(
          title: state.data.docs[index]['title'],
          subtitle: state.data.docs[index]['subtitle'],
          imageURL: state.data.docs[index]['imageURL'],
          cost: state.data.docs[index]['cost'],
          likesCount: state.data.docs[index]['likesCount'],
          grams: state.data.docs[index]['grams'],
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        height: 0,
        indent: 0,
        thickness: 1,
      ),
    );
  }
}
