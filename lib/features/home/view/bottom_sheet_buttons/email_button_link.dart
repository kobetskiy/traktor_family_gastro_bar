import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/home/service/contact_button_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class EmailButtonLink extends StatelessWidget {
  const EmailButtonLink({super.key});

  @override
  Widget build(BuildContext context) {

    final contactButtonService = ContactButtonService();
    final uri = Uri(scheme: contactButtonService.emailScheme);

    return PrimaryButton.outlined(
      onPressed: () => contactButtonService.openLink(context, uri),
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
          Text(S.of(context).writeOnEmail),
        ],
      ),
    );
  }
}
