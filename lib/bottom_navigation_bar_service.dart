import 'package:flutter/material.dart';

import 'features/screens.dart';

class BottomNavigationBarService {
  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex;
  set setSelectedIndex(int value) => _selectedIndex = value;

  final List<Widget> widgetOptions = [
    const HomeScreen(),
    const MealsListScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];

  void onTap(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
  }
}
