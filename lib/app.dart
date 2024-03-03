import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/core/localization/app_localization.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'internet_connection/index.dart';

final Connectivity connectivity = Connectivity();
final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealsListBloc>(create: (context) => MealsListBloc()),
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),
      ],
      child: MaterialApp(
        title: "Traktor Bar",
        debugShowCheckedModeBanner: false,
        theme: theme,
        navigatorKey: kNavigatorKey,
        locale: AppLocalization.locale,
        localizationsDelegates: AppLocalization.localizationsDelegates,
        supportedLocales: AppLocalization.supportedLocales,
        home: const LoadingScreen(),
        builder: (context, child) => BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            late final Widget page;
            switch (state.type) {
              case InternetTypes.connected:
                page = const HomeScreen();
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
  }
}
