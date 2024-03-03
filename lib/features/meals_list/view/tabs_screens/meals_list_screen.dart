import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/tabs_screens.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/widgets/index.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealsListScreen extends StatefulWidget {
  const MealsListScreen({super.key});

  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

const allTabs = [
  EuropeanCuisineTab(),
  JapaneseCuisineTab(),
  BarbecueMenuTab(),
  BarTab(),
  HookahTab(),
];

List<Tab> allTabsNames(BuildContext context) => [
  Tab(child: Text(S.of(context).europeanCuisine)),
  Tab(child: Text(S.of(context).japaneseCuisine)),
  Tab(child: Text(S.of(context).barbecueMenu)),
  Tab(child: Text(S.of(context).bar)),
  Tab(child: Text(S.of(context).hookah)),
];

class _MealsListScreenState extends State<MealsListScreen> {
  bool isSearchShown = false;
  final _textController = TextEditingController();
  final mealsListBloc = MealsListBloc();

  void switchSearchField() {
    _textController.clear();
    isSearchShown = !isSearchShown;
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: allTabs.length,
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
                    onPressed: switchSearchField,
                  )
                ],
              ),
            ],
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                isSearchShown
                    ? SearchTextFieldWidget(
                        controller: _textController, bloc: mealsListBloc)
                    : const _TabBarWidget(),
                isSearchShown
                    ? SearchedMealsListWidget(
                        controller: _textController, bloc: mealsListBloc)
                    : const _TabBarViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarWidget extends StatelessWidget {
  const _TabBarWidget();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabs: allTabsNames(context),
    );
  }
}

class _TabBarViewWidget extends StatelessWidget {
  const _TabBarViewWidget();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: allTabs,
      ),
    );
  }
}
