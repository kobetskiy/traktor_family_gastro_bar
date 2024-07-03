import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import '../view/tabs_screens/tabs_screens.dart';

class TabService with ChangeNotifier {
  TabController? controller;
  bool _isSearchShown = false;
  bool get isSearchShown => _isSearchShown;

  final List<Widget> allTabs = [
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

  void init(TickerProvider vsync) {
    controller = TabController(length: allTabs.length, vsync: vsync);
    controller!.addListener(notifyListeners);
  }

  void disposeController() {
    controller?.removeListener(notifyListeners);
    controller?.dispose();
  }

  void switchSearchField() {
    _isSearchShown = !_isSearchShown;
    notifyListeners();
  }
}
