import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/bottom_navigation_bar_service.dart';

import 'features/widgets/bottom_navigation_bar_widget.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final bottomNavBarService = BottomNavigationBarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavBarService.widgetOptions.elementAt(
        bottomNavBarService.getSelectedIndex,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: BottomNavigationBarWidget(
          tabIndex: bottomNavBarService.getSelectedIndex,
          onTap: (int value) {
            bottomNavBarService.onTap(value);
            setState(() {});
          },
        ),
      ),
    );
  }
}
