import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import 'tabs_screens.dart';

class TabService {
  TabController? tabController;
  bool _isSearchShown = false;
  bool get isSearchShown => _isSearchShown;

  List<Widget> allTabs = [
    const EuropeanCuisineTab(),
    const JapaneseCuisineTab(),
    const BarbecueMenuTab(),
    const BarTab(),
    const HookahTab(),
  ];

  List<Tab> allTabsNames(BuildContext context) => [
        Tab(child: Text(S.of(context).europeanCuisine)),
        Tab(child: Text(S.of(context).japaneseCuisine)),
        Tab(child: Text(S.of(context).barbecueMenu)),
        Tab(child: Text(S.of(context).bar)),
        Tab(child: Text(S.of(context).hookah)),
      ];

  void switchSearchField() {
    _isSearchShown = !_isSearchShown;
  }
}
