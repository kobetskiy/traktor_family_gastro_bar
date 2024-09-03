import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/meal_card/meal_card.dart';
import 'package:traktor_family_gastro_bar/features/widgets/watermark_widget.dart';

class MealsListViewWidget extends StatelessWidget {
  const MealsListViewWidget({super.key, required this.state});

  final MealsListSuccess state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.separated(
          itemCount: state.data.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (_, int index) => MealCard(
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
          ),
          separatorBuilder: (_, __) => const Divider(height: 0),
        ),
        const WatermarkWidget()
      ],
    );
  }
}
