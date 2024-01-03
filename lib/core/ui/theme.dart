import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
);
