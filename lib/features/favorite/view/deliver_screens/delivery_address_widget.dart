import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({
    super.key,
    required this.formKey,
    required this.addressController,
    required this.commentController,
  });

  final TextEditingController addressController;
  final TextEditingController commentController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Divider(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
            Form(
              key: formKey,
              child: _AddressTextField(addressController),
            ),
            const SizedBox(height: 20),
            _CommentTextField(commentController),
          ],
        ),
      ),
    );
  }
}

class _CommentTextField extends StatelessWidget {
  const _CommentTextField(this.commentController);

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).commentToTheAddress,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: commentController,
          hintText: S.of(context).entranceFloorAndOther,
        ),
      ],
    );
  }
}

class _AddressTextField extends StatelessWidget {
  const _AddressTextField(this.addressController);

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).addressAndHouseNumber,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: addressController,
          hintText: S.of(context).streetBuildingApartmentNumber,
          validator: TextFieldValidator.validateAddress,
        ),
      ],
    );
  }
}
