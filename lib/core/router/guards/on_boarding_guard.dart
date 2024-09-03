import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';

class OnBoardingGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final prefs = await SharedPreferences.getInstance();
    final hasOnBoardingShown = prefs.getBool('hasOnBoardingShown') ?? false;

    if (hasOnBoardingShown) {
      resolver.next(true);
    } else {
      resolver.redirect(const OnBoardingRoute()); // TODO: fix OnBoardingScreen display. it shows even when user is logged in
    }
  }
}
