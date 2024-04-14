import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/bottom_navigation_bar_service.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meals_list_screen.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/tab_service.dart';

final _tabService = TabService();

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _tabService.allTabs.length,
          itemBuilder: (_, int index) => _HomeCategoriesContent(index: index),
          separatorBuilder: (_, __) => const SizedBox(width: 20),
        ),
      ),
    );
  }
}

class _HomeCategoriesContent extends StatefulWidget {
  const _HomeCategoriesContent({required this.index});

  final int index;

  @override
  State<_HomeCategoriesContent> createState() => _HomeCategoriesContentState();
}

class _HomeCategoriesContentState extends State<_HomeCategoriesContent> {
  final bottomNavBarService = BottomNavigationBarService();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: () {},
        child: SizedBox(
          width: 80,
          height: 80,
          child: Center(
            child: Image.asset(
              TabIcons.tabIconsList[widget.index],
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
