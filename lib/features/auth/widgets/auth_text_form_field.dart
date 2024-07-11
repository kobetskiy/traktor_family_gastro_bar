import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.isObscureText,
    this.suffixIcon,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final bool? isObscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
      obscureText: isObscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: textTheme.titleSmall!.copyWith(color: Colors.grey[600]),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        suffixIcon: suffixIcon,
      ),
    );
  }
}
