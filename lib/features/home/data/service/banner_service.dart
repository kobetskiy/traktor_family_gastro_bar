import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/home/view/banner_screen.dart';

class BannerService {

  Future<QuerySnapshot<Map<String, dynamic>>> getBanners() async {
    return await FirebaseFirestore.instance
        .collection(DatabaseCollections.bannersCollection)
        .get();
  }

  void navigateTo({
    required BuildContext context,
    required String bannerTitle,
    required String bannerContent,
    required String bannerAppBarTitle,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BannerScreen(
          title: bannerTitle,
          content: bannerContent,
          appBarTitle: bannerAppBarTitle,
        ),
      ),
    );
  }
}
