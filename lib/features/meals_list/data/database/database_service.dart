import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/exeptions.dart';

import 'collections.dart';

class DatabaseServise {
  Future<QuerySnapshot<Map<String, dynamic>>> allMeals(
    String collection,
  ) async {
    return await FirebaseFirestore.instance.collection(collection).get();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchedMeals(
    String query,
  ) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> searchedData = [];
    for (var collection in Collections.collectionsList) {
      if (query != '') {
        final allMealsList =
            await FirebaseFirestore.instance.collection(collection).get();
        searchedData.addAll(allMealsList.docs
            .where((element) =>
                element['title'].toString().toLowerCase().startsWith(query))
            .toList());
        if (allMealsList.docs.isEmpty) throw ServerExeption();
      }
    }
    return searchedData;
  }
}
