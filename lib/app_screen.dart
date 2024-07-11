import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/bottom_navigation_bar_service.dart';
import 'package:traktor_family_gastro_bar/features/data/database/database_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/notifications_service.dart';

import 'features/widgets/bottom_navigation_bar_widget.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final firestore = FirebaseFirestore.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   final docsStream =
  //       firestore.collection(DatabaseCollections.mealsCollection).snapshots();
  //   docsStream.listen((event) {
  //     if (event.docs.isEmpty) return;
  //     for (var change in event.docChanges) {
  //       if (change.type == DocumentChangeType.added) {
  //         NotificationService.showInstantNotification(
  //           "Instant Notification",
  //           "A new item was added",
  //         );
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarService>(
        builder: (context, bottomNavBarService, child) {
      return Scaffold(
        body: bottomNavBarService.widgetOptions.elementAt(
          bottomNavBarService.selectedIndex,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(splashColor: Colors.transparent),
          child: BottomNavigationBarWidget(
            tabIndex: bottomNavBarService.selectedIndex,
            onTap: bottomNavBarService.onTap,
          ),
        ),
      );
    });
  }
}
