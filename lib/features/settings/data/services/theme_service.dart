import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  Future<void> saveTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeName = '';
    if (themeMode == ThemeMode.dark) {
      themeName = 'dark';
    } else if (themeMode == ThemeMode.light) {
      themeName = 'light';
    } else {
      themeName = 'system';
    }
    prefs.setString('theme', themeName);
  }

  Future<ThemeMode> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString('theme') ?? 'dark';
    late ThemeMode result;
    if (themeName == 'dark') {
      result = ThemeMode.dark;
    } else if (themeName == 'light') {
      result = ThemeMode.light;
    } else {
      result = ThemeMode.system;
    }
    return result;
  }
}
