import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';

final bodyMedium = TextStyle(
  color: AppColors.titleColor,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

final bodySmall = TextStyle(
  color: AppColors.titleColor,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);

final titleMedium = TextStyle(
  color: AppColors.titleColor,
  fontSize: 19,
  fontWeight: FontWeight.w600,
);

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    // primary: AppColors.primaryColor,
    // background: AppColors.backgroundColor,
    // surface: AppColors.formColor,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.primaryColor,
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
    iconColor: MaterialStatePropertyAll(AppColors.subtitleColor),
  )),
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
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    titleMedium: titleMedium,
  ),
);
