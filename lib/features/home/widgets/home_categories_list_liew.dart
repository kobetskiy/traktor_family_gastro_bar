import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/bottom_navigation_bar_service.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
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
  @override
  Widget build(BuildContext context) {
    final tabService = Provider.of<TabService>(context, listen: false);

    return Consumer<BottomNavigationBarService>(
        builder: (context, bottomNavBarService, child) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.zero,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              tabService.controller!.index = widget.index;
              bottomNavBarService.onTap(1);
            },
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
    );
  }
}
