import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/localization/app_localization.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/app/view/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traktor Bar",
      debugShowCheckedModeBanner: false,
      theme: theme,
      locale: AppLocalization.locale,
      localizationsDelegates: AppLocalization.localizationsDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      home: const HomeScreen(),
    );
  }
}
