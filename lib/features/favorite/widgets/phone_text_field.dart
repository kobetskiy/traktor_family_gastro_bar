import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/text_field_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField(this.phoneController, {super.key});

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).phoneNumber,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: phoneController,
          keyboardType: TextInputType.number,
          prefix: '+380',
          validator: (value) => TextFieldValidator.validatePhone(
            value,
            canBeNull: false,
          ),
        ),
      ],
    );
  }
}
