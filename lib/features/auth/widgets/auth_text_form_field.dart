import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.isObscureText,
  });

  final String label;
  final TextEditingController controller;
  final bool? isObscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        label: Text(label, style: textTheme.bodySmall),
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
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear_rounded),
          color: Colors.grey[600],
          onPressed: () {},
        ),
      ),
    );
  }
}
