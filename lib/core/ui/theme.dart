import 'package:flutter/material.dart';

abstract class _AppColors {
  static const primary = Color(0xFFFFA11B);
  static const darkSecondary = Color(0xFFF3BF77);
  static const darkSurface = Color(0xFF111111);
  static const lightSecondary = Color.fromRGBO(183, 124, 41, 1);
  static const lightSurface = Color(0xFFEEEEEE);
  static const error = Color(0xFFFF5B4F);
  static const sucess = Color(0xFF27AE60);
}

abstract class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _AppColors.primary,
      brightness: Brightness.dark,
      primary: _AppColors.primary,
      secondary: _AppColors.darkSecondary,
      surface: _AppColors.darkSurface,
      error: _AppColors.error,
    ),
    primaryColor: _AppColors.primary,
    useMaterial3: true,
    scaffoldBackgroundColor: _AppColors.darkSurface,
    fontFamily: 'OpenSans',
    bottomSheetTheme: bottomSheetTheme(_AppColors.darkSurface),
    iconButtonTheme: __iconButtonThemeData,
    tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
    dividerTheme: const DividerThemeData(indent: 0, thickness: 1),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      labelStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[850],
      contentTextStyle: const TextStyle(
        color: Color(0xFFEDEDED),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dismissDirection: DismissDirection.down,
      behavior: SnackBarBehavior.floating,
      elevation: 7,
    ),
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
      error: _AppColors.error,
    ),
    primaryColor: _AppColors.primary,
    useMaterial3: true,
    scaffoldBackgroundColor: _AppColors.lightSurface,
    fontFamily: 'OpenSans',
    bottomSheetTheme: bottomSheetTheme(_AppColors.lightSurface),
    iconButtonTheme: __iconButtonThemeData,
    tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
    dividerTheme: const DividerThemeData(indent: 0, thickness: 1),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      labelStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[350],
      contentTextStyle: const TextStyle(
        color: Color(0xFF0E0E0E),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      dismissDirection: DismissDirection.down,
      behavior: SnackBarBehavior.floating,
      elevation: 7,
    ),
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

extension ColorSchemeExtension on ColorScheme {
  Color get success => _AppColors.sucess;
}
