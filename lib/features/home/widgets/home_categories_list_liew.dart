import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/meals_list_screen.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: allTabs.length,
        itemBuilder: (_, int index) => _HomeCategoriesContent(index: index),
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}

class _HomeCategoriesContent extends StatelessWidget {
  const _HomeCategoriesContent({required this.index});

  final int index;

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
              TabIcons.tabIconsList[index],
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
