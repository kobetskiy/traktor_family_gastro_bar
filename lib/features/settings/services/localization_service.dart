import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  Future<void> saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', locale.languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('lang') ?? 'uk';
    return Locale(languageCode);
  }
}