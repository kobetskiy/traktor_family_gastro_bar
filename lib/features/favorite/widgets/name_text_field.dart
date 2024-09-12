import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/text_field_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class NameTextField extends StatelessWidget {
  const NameTextField(this.nameController, {super.key});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: nameController,
          hintText: S.of(context).name,
          validator: TextFieldValidator.validateName,
        ),
      ],
    );
  }
}
