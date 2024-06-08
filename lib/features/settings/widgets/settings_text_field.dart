import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';

class SettingsTextField extends StatelessWidget {
  const SettingsTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.keyboardType,
  })  : validator = null,
        isForm = false,
        enabled = false;

  const SettingsTextField.form({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.keyboardType,
    this.validator,
    this.enabled = true,
  }) : isForm = true;

  final TextEditingController controller;
  final String hintText;
  final String? prefix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isForm;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      prefixIcon: prefix != null
          ? Padding(
              padding: const EdgeInsets.only(left: 20, top: 12.5),
              child: Text(prefix!, style: AppTextStyles.titleSmall),
            )
          : null,
      hintText: hintText,
      hintStyle: AppTextStyles.titleSmall.copyWith(
        color: AppColors.subtitleColor,
      ),
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
    );

    return isForm
        ? TextFormField(
            controller: controller,
            enabled: enabled,
            style: AppTextStyles.titleSmall,
            keyboardType: keyboardType,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: decoration,
          )
        : TextField(
            controller: controller,
            style: AppTextStyles.titleSmall,
            keyboardType: keyboardType,
            minLines: 1,
            maxLines: 6,
            decoration: decoration,
          );
  }
}
