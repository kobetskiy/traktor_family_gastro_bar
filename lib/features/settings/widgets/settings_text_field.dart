import 'package:flutter/material.dart';

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
              child:
                  Text(prefix!, style: Theme.of(context).textTheme.titleSmall),
            )
          : null,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey[600],
          ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear_rounded),
        color: Colors.grey[600],
        onPressed: () => controller.clear(),
      ),
    );

    return isForm
        ? TextFormField(
            controller: controller,
            enabled: enabled,
            style: Theme.of(context).textTheme.titleSmall,
            keyboardType: keyboardType,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: decoration,
          )
        : TextField(
            controller: controller,
            style: Theme.of(context).textTheme.titleSmall,
            keyboardType: keyboardType,
            minLines: 1,
            maxLines: 6,
            decoration: decoration,
          );
  }
}
