import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/tabs_screens.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealsListScreen extends StatelessWidget {
  const MealsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              AppBarWidget(
                title: 'Traktor Family Gastro Bar',
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  )
                ],
              ),
            ],
            body: const Column(
              children: [
                TabBarWidget(),
                TabBarViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabs: [
        Tab(child: Text(S.of(context).europeanCuisine)),
        Tab(child: Text(S.of(context).barbecueMenu)),
        Tab(child: Text(S.of(context).bar)),
        Tab(child: Text(S.of(context).hookah)),
      ],
    );
  }
}

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          EuropeanCuisineTab(),
          BarbecueMenuTab(),
          BarTab(),
          HookahTab(),
        ],
      ),
    );
  }
}
