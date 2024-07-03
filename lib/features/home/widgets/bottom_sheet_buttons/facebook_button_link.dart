import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/url_launcher_service.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class FacebookButtonLink extends StatelessWidget {
  const FacebookButtonLink({super.key});

  @override
  Widget build(BuildContext context) {
    final contactButtonService = UrlLauncherService();
    final uri = Uri.parse(contactButtonService.facebookLink);

    return PrimaryButton.outlined(
      onPressed: () => contactButtonService.openLink(context, uri),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(AppIcons.facebook),
          ),
          const SizedBox(width: 10),
          Text(
            S.of(context).writeOnFacebook,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
