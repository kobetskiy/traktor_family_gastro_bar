import 'package:flutter/material.dart';
import 'features/screens.dart';
import 'features/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    MealsListScreen(),
    FavoriteScreen(),
    OrderedMealsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
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
