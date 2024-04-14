import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.tabIndex,
    this.onTap,
  });

  final int tabIndex;
  final void Function(int)? onTap;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.subtitleColor,
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_rounded),
          label: '',
        ),
      ],
      currentIndex: widget.tabIndex,
      onTap: widget.onTap,
    );
  }
}
