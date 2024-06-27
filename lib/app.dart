import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/bottom_navigation_bar_service.dart';
import 'package:traktor_family_gastro_bar/core/localization/app_localization.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/view/tabs_screens/tab_service.dart';
import 'package:traktor_family_gastro_bar/features/settings/bloc/localization_bloc.dart';

import 'internet_connection/index.dart';

final Connectivity connectivity = Connectivity();
final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarService>(
            create: (context) => BottomNavigationBarService()),
        ChangeNotifierProvider<TabService>(create: (context) => TabService()),
        BlocProvider<MealsListBloc>(create: (context) => MealsListBloc()),
        BlocProvider<LocalizationBloc>(
          create: (context) => LocalizationBloc()..add(LoadSavedLocalization()),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            title: "Traktor Bar",
            debugShowCheckedModeBanner: false,
            theme: theme,
            navigatorKey: kNavigatorKey,
            locale: state.locale,
            localizationsDelegates: AppLocalization.localizationsDelegates,
            supportedLocales: AppLocalization.supportedLocales,
            home: const LoadingScreen(),
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1)),
              child: BlocListener<InternetCubit, InternetState>(
                listener: (context, state) {
                  late final Widget page;
                  switch (state.type) {
                    case InternetTypes.connected:
                      page = const AppScreen();
                      break;
                    case InternetTypes.offline:
                      page = const NoInternetScreen();
                      break;
                    default:
                      page = const LoadingScreen();
                  }
                  kNavigatorKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => page,
                    ),
                    (route) => false,
                  );
                },
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
