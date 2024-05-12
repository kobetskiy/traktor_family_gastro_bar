import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/home/data/models/user_banner.dart';
import 'package:traktor_family_gastro_bar/features/home/view/banner_screen.dart';

class BannerService {
  // List<UserBanner> bannersList = [
  //   UserBanner(
  //     title: 'З\'їш піцу за 4 хвилину та отримай 500грн',
  //     subtitle: 'З\'їш піцу за 4 хвилину та отримай 500грн',
  //     appBarTitle: 'Пропозиція',
  //     imagePath: AppImages.banners[0]
  //   ),
  //   UserBanner(
  //     title: '-20% на коктейлі при замовленні стейку',
  //     subtitle: '-20% на коктейлі при замовленні стейку',
  //     appBarTitle: 'Акція',
  //     imagePath: AppImages.banners[1]
  //   ),
  //   UserBanner(
  //     title: 'Новий ніжний стейк з овочами',
  //     subtitle: 'Новий ніжний стейк з овочами',
  //     appBarTitle: 'Пропозиція',
  //     imagePath: AppImages.banners[2]
  //   ),
  // ];

  Future<List<UserBanner>> getBannerData() async {
    final imageURL = await getBannerImageURL("banner_1.jpg");
    return [];
  }

  Future<String> getBannerImageURL(String imageName) async {
    final storage = FirebaseStorage.instance;
    final imageUrl = await storage.ref().child(imageName).getDownloadURL();
    return imageUrl;
  }

  void navigateTo(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BannerScreen(
          title: 'З\'їш піцу за 4 хвилини та отримай 500грн',
          content:
              'З\'їш піцу за 4 хвилини та отримай 500грн. З\'їш піцу за 4 хвилини та отримай 500грн. З\'їш піцу за 4 хвилини та отримай 500грнЗ\'їш піцу за 4 хвилини та отримай 500грн.',
          appBarTitle: 'Пропозиція',
        ),
      ),
    );
  }
}
