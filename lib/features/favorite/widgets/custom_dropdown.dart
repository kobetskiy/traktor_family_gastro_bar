import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.controller,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.errorMessage,
  });

  final TextEditingController controller;
  final List<String> items;
  final void Function(String? value) onChanged;
  final String? hintText;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final String? initialValue =
        items.contains(controller.text) ? controller.text : null;
    return DropdownButtonFormField<String>(
      value: initialValue,
      dropdownColor: Colors.grey[900],
      borderRadius: BorderRadius.circular(15),
      menuMaxHeight: MediaQuery.sizeOf(context).height * 0.4,
      hint: Text(
        hintText ?? '',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey[600],
            ),
      ),
      onChanged: onChanged,
      validator: (value) => TextFieldValidator.validateNotNull(
        value,
        errorMessage ?? S.of(context).pleaseSelectAnOption,
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      }).toList(),
    );
  }
}
