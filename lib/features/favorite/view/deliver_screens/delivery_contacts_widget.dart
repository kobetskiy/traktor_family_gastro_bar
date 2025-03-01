import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class DeliveryContactsWidget extends StatefulWidget {
  const DeliveryContactsWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.onTipSelected,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final Function(int value) onTipSelected;

  @override
  State<DeliveryContactsWidget> createState() => _DeliveryContactsWidgetState();
}

class _DeliveryContactsWidgetState extends State<DeliveryContactsWidget> {
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
                  const SizedBox(height: 30),
                  Text(
                    S.of(context).doYouWantToLeaveATip,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GroupButton(
                      isRadio: true,
                      buttons: const ['0%', '5%', '10%', '15%', '20%'],
                      onSelected: (index, isSelected) {
                        widget.onTipSelected(index * 5);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              S.of(context).withinTheCurrentCurfew,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
