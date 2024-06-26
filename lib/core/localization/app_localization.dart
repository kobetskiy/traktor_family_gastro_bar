import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

abstract class AppLocalization {
  static Locale locale = const Locale('en');
  static Iterable<LocalizationsDelegate> localizationsDelegates = const [
    S.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];
  static Iterable<Locale> supportedLocales = S.delegate.supportedLocales;
}
