import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MealsDatabaseService {
  static final Stream<QuerySnapshot> europeanCuisine =
      FirebaseFirestore.instance.collection('european-cuisine').snapshots();
} 