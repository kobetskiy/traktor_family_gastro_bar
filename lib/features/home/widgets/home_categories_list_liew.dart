import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/services/tab_service.dart';

final _tabService = TabService();

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Center(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
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

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 15),
        elevation: 7,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: () {
            tabService.controller!.index = widget.index;
            context.tabsRouter.setActiveIndex(1);
          },
          child: SizedBox(
            width: 80,
            child: Center(
              child: Image.asset(
                TabIcons.tabIconsList[widget.index],
                color:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : null,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
    );
  }
}
