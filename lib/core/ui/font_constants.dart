import 'package:flutter/material.dart';
import 'colors_constants.dart';

abstract class AppTextStyles {
    static final titleSmall = TextStyle(
    color: AppColors.titleColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final subtitle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final titleLarge = TextStyle(
    color: AppColors.titleColor,
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );
}