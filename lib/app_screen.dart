import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/bottom_navigation_bar_service.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'features/widgets/bottom_navigation_bar_widget.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MealsListRoute(),
        FavoriteRoute(),
        SettingsRoute()
      ],
      bottomNavigationBuilder: (context, tabsRouter) => Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: BottomNavigationBarWidget(
          tabIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        ),
      ),
    );
  }
}
