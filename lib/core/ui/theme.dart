import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.primaryColor,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColors.subtitleColor),
    ),
  ),
  
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  fontFamily: 'OpenSans',
  tabBarTheme: TabBarTheme(
    dividerColor: Colors.transparent,
    unselectedLabelColor: AppColors.titleColor,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),
  dividerTheme: const DividerThemeData(
    indent: 0,
    thickness: 1,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
);
