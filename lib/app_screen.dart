import 'package:flutter/material.dart';

import 'features/screens.dart';
import 'features/widgets/bottom_navigation_bar_widget.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    MealsListScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBarWidget(
          tabIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
