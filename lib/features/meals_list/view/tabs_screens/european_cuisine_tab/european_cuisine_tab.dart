import 'package:flutter/material.dart';

import 'meal_card.dart';

class EuropeanCuisineTab extends StatelessWidget {
  const EuropeanCuisineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return const MealCard(
          title: 'Англійський сніданок',
          cost: '175',
          likesCount: '22',
          grams: '390',
          subtitle:
              'Страва з яєць, баварських ковбасок з фасолю, беконом та міксом салату. Також в страві подається грінки з піджаркою луку та бекону',
          imageURL:
              'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/sCQGZhk-IEZJXnx-henbgqF.jpeg',
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
