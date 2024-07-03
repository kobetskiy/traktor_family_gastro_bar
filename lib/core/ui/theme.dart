import 'package:flutter/material.dart';

abstract class _AppColors {
  static const primary = Color(0xFFFFA11B);
  static const darkSecondary = Color(0xFFF3BF77);
  static const darkSurface = Color(0xFF111111);
  static const lightSecondary = Color(0xFFB77C29);
  static const lightSurface = Color(0xFFEEEEEE);
}

abstract class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _AppColors.primary,
      brightness: Brightness.dark,
      primary: _AppColors.primary,
      secondary: _AppColors.darkSecondary,
      surface: _AppColors.darkSurface,
    ),
    primaryColor: _AppColors.primary,
    useMaterial3: true,
    scaffoldBackgroundColor: _AppColors.darkSurface,
    fontFamily: 'OpenSans',
    bottomSheetTheme: bottomSheetTheme(_AppColors.darkSurface),
    iconButtonTheme: __iconButtonThemeData,
    tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
    dividerTheme: const DividerThemeData(indent: 0, thickness: 1),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 19,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _AppColors.primary,
      brightness: Brightness.light,
      primary: _AppColors.primary,
      secondary: _AppColors.lightSecondary,
      surface: _AppColors.lightSurface,
    ),
    primaryColor: _AppColors.primary,
    useMaterial3: true,
    scaffoldBackgroundColor: _AppColors.lightSurface,
    fontFamily: 'OpenSans',
    bottomSheetTheme: bottomSheetTheme(_AppColors.lightSurface),
    iconButtonTheme: __iconButtonThemeData,
    tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
    dividerTheme: const DividerThemeData(indent: 0, thickness: 1),
    cardColor: const Color(0xFFBCBCBC),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFF000000),
        fontSize: 19,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF000000),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF000000),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

final __iconButtonThemeData = IconButtonThemeData(
  style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.grey[600])),
);

BottomSheetThemeData bottomSheetTheme(Color backgroundColor) {
  return BottomSheetThemeData(
    backgroundColor: backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  );
}
