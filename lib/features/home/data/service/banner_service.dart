import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';

class BannerService {
  Future<QuerySnapshot<Map<String, dynamic>>> getBanners() async {
    return await FirebaseFirestore.instance
        .collection(DatabaseCollections.banners)
        .get();
  }
}
