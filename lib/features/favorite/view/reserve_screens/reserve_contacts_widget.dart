import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ReserveContactsWidget extends StatefulWidget {
  const ReserveContactsWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.commentController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController commentController;

  @override
  State<ReserveContactsWidget> createState() => _DeliveryContactsWidgetState();
}

class _DeliveryContactsWidgetState extends State<ReserveContactsWidget> {
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
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameTextField(widget.nameController),
                  const SizedBox(height: 20),
                  PhoneTextField(widget.phoneController),
                  const SizedBox(height: 20),
                  _CommentTextField(widget.commentController),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
          S.of(context).wishesOrComments,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFieldWidget.form(
          controller: commentController,
          hintText: S.of(context).aTableByTheWindow,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
