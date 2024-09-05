import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({
    super.key,
    required this.formKey,
    required this.addressController,
    required this.commentController
  });

  final TextEditingController addressController;
  final TextEditingController commentController;
  final GlobalKey<FormState> formKey;

  @override
  State<DeliveryAddressWidget> createState() => DeliveryAddressWidgetState();
}

class DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  final _formKey = GlobalKey<FormState>();

  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Divider(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
              Form(
                key: widget.formKey,
                child: _AddressTextField(
                  addressController: widget.addressController,
                ),
              ),
              const SizedBox(height: 20),
              _CommentTextField(commentController: widget.commentController),
              const SizedBox(height: 30),
              Text(
                "В межах діючої комендантської години останнє замовлення не може бути прийняте пізніше 21:30год. Оскільки нашим кур’єрам необхідно повернутися після доставки. Час готовності замовлення від 20хв. Час доставки замовлень від 20хв. У разі наявності повітряних тривог час доставки може збільшуватись",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommentTextField extends StatelessWidget {
  const _CommentTextField({required this.commentController});

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Коментар до адреси",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: commentController,
          hintText: 'Під’їзд, поверх та інше',
        ),
      ],
    );
  }
}

class _AddressTextField extends StatelessWidget {
  const _AddressTextField({required this.addressController});

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Адреса та номер будинку",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: addressController,
          hintText: 'Вулиця, будинок, номер квартири',
          validator: TextFieldValidator.validateAddress,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.map_outlined, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
