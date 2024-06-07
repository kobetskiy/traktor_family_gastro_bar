import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';

class SettingsTextField extends StatelessWidget {
  const SettingsTextField({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyles.titleSmall,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            AppTextStyles.titleSmall.copyWith(color: AppColors.subtitleColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.titleColor),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear_rounded),
          color: AppColors.subtitleColor,
          onPressed: () => controller.clear(),
        ),
      ),
    );
  }
}
