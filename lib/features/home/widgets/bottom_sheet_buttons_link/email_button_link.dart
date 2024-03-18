import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';

class EmailButtonLink extends StatelessWidget {
  const EmailButtonLink({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton.outlined(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(AppIcons.email),
          ),
          const SizedBox(width: 10),
          const Text('Написати на Email'),
        ],
      ),
    );
  }
}