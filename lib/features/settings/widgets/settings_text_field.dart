import 'package:flutter/material.dart';

enum SettingsTextFieldType { textField, textFormField, textFormFieldMultiline }

class SettingsTextField extends StatelessWidget {
  const SettingsTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefix,
    this.keyboardType,
  })  : validator = null,
        settingsTextFieldType = SettingsTextFieldType.textField,
        enabled = false;

  const SettingsTextField.form({
    super.key,
    required this.controller,
    this.hintText,
    this.prefix,
    this.keyboardType,
    this.validator,
    this.enabled = true,
  }) : settingsTextFieldType = SettingsTextFieldType.textFormField;

  const SettingsTextField.formMultiline({
    super.key,
    required this.controller,
    this.hintText,
    this.prefix,
    this.keyboardType,
    this.validator,
    this.enabled = true,
  }) : settingsTextFieldType = SettingsTextFieldType.textFormFieldMultiline;

  final TextEditingController controller;
  final String? hintText;
  final String? prefix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final SettingsTextFieldType settingsTextFieldType;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      prefixIcon: prefix != null
          ? Padding(
              padding: const EdgeInsets.only(left: 20, top: 13.5),
              child:
                  Text(prefix!, style: Theme.of(context).textTheme.titleSmall),
            )
          : null,
      hintText: hintText,
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear_rounded),
        color: Colors.grey[600],
        onPressed: () => controller.clear(),
      ),
    );

    switch (settingsTextFieldType) {
      case SettingsTextFieldType.textField:
        return TextField(
          controller: controller,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: keyboardType,
          minLines: 1,
          maxLines: 6,
          decoration: decoration,
        );
      case SettingsTextFieldType.textFormField:
        return TextFormField(
          controller: controller,
          enabled: enabled,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: keyboardType,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: decoration,
        );
      case SettingsTextFieldType.textFormFieldMultiline:
        return TextFormField(
          controller: controller,
          enabled: enabled,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: keyboardType,
          minLines: 1,
          maxLines: 6,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: decoration,
        );
    }
  }
}
