import 'package:flutter/material.dart';
import 'features/screens.dart';

class BottomNavigationBarService with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> widgetOptions = [
    const HomeScreen(),
    const MealsListScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];

  void onTap(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }
}