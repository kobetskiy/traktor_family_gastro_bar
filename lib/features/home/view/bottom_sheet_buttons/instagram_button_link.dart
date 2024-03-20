import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/widgets/adaptive_alert_dialog.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramButtonLink extends StatelessWidget {
  const InstagramButtonLink({super.key});

  @override
  Widget build(BuildContext context) {
    void onInstagramButtonPressed() async {
      final uri = Uri.parse('https://www.instagram.com/traktor_gastrobar/');
      if (await canLaunchUrl(uri)) {
        launchUrl(uri);
      } else {
        if (context.mounted) {
          showAdaptiveDialog(
            context: context,
            builder: (context) => AdaptiveAlertDialog(
              content: S.current.wrongLinkDialogText,
            ),
          );
        }
      }
    }

    return PrimaryButton.outlined(
      onPressed: onInstagramButtonPressed,
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
