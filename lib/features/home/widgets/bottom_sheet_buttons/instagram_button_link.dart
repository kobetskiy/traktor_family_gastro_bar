import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/home/data/service/contact_button_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class InstagramButtonLink extends StatelessWidget {
  const InstagramButtonLink({super.key});

  @override
  Widget build(BuildContext context) {

    final contactButtonService = ContactButtonService();
    final uri = Uri.parse(contactButtonService.instagramLink);

    return PrimaryButton.outlined(
      onPressed: () => contactButtonService.openLink(context, uri),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(AppIcons.instagram),
          ),
          const SizedBox(width: 10),
          Text(S.of(context).writeOnInstagram),
        ],
      ),
    );
  }
}
