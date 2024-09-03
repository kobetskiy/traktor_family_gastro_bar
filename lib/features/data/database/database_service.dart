import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traktor_family_gastro_bar/features/data/exeptions.dart';

import 'database_constants.dart';

class DatabaseServise {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllMeals(
      String category) async {
    return await FirebaseFirestore.instance
        .collection(DatabaseCollections.meals)
        .where(DatabaseMealFields.category, isEqualTo: category)
        .get();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSearchedMeals(
      String query) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> searchedData = [];
    if (query != '') {
      final allMealsList = await FirebaseFirestore.instance
          .collection(DatabaseCollections.meals)
          .get();
      searchedData.addAll(allMealsList.docs
          .where((element) => element[DatabaseMealFields.title]
              .toString()
              .toLowerCase()
              .startsWith(query))
          .toList());
      if (allMealsList.docs.isEmpty) throw ServerExeption();
    }
    return searchedData;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFilteredMeals(
    String filterField,
  ) async {
    return await FirebaseFirestore.instance
        .collection(DatabaseCollections.meals)
        .orderBy(filterField, descending: true)
        .get();
  }
}
