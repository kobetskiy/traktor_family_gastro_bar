import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/models/meal_model.dart';

import 'meal_card/meal_card.dart';

class EuropeanCuisineTab extends StatelessWidget {
  const EuropeanCuisineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return MealCard(
          mealModel: MealModel(
            title: 'Бургер з качиною котлетою та грушею',
            cost: '135',
            likesCount: '13',
            grams: '370',
            subtitle:
                'Страва з яєць, баварських ковбасок з фасолю, беконом та міксом салату. Також в страві подається грінки з піджаркою луку та бекону',
            imageURL:
                'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/SyLrtkb-ylGeFXa-mJvsCuP.jpeg',
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 0,
        indent: 0,
        thickness: 1,
      ),
    );
  }
}
