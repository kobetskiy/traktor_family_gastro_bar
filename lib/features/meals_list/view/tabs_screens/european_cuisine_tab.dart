import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/data/database/meals_database_service.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/models/meal_model.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meal_card/meal_card.dart';

class EuropeanCuisineTab extends StatelessWidget {
  const EuropeanCuisineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: MealsDatabaseService.europeanCuisine,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.separated(
            itemCount: data.size,
            itemBuilder: (BuildContext context, int index) {
              return MealCard(
                mealModel: MealModel(
                  title: data.docs[index]['title'],
                  cost: data.docs[index]['cost'],
                  likesCount: data.docs[index]['likesCount'],
                  grams: data.docs[index]['grams'],
                  subtitle: data.docs[index]['subtitle'],
                  imageURL: data.docs[index]['imageURL'],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 0,
              indent: 0,
              thickness: 1,
            ),
          );
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.separated(
  //     itemCount: 15,
  //     itemBuilder: (BuildContext context, int index) {
  //       return MealCard(
  //         mealModel: MealModel(
  //           title: 'Бургер з качиною котлетою та грушею',
  //           cost: '135',
  //           likesCount: '13',
  //           grams: '370',
  //           subtitle:
  //               'Страва з яєць, баварських ковбасок з фасолю, беконом та міксом салату. Також в страві подається грінки з піджаркою луку та бекону',
  //           imageURL:
  //               'https://cdn-media.choiceqr.com/prod-eat-traktorgastrobar/menu/SyLrtkb-ylGeFXa-mJvsCuP.jpeg',
  //         ),
  //       );
  //     },
  //     separatorBuilder: (context, index) => const Divider(
  //       height: 0,
  //       indent: 0,
  //       thickness: 1,
  //     ),
  //   );
  // }
}
