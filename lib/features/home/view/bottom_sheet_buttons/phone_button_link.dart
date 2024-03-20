import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneButtonLink extends StatelessWidget {
  const PhoneButtonLink({super.key});

  @override
  Widget build(BuildContext context) {
    void onPhoneButtonPressed() async {
      final uri = Uri.parse('tel:+380936767646');
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
      onPressed: onPhoneButtonPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(AppIcons.phone),
          ),
          const SizedBox(width: 10),
          const Text('+380936767646'),
        ],
      ),
    );
  }
}