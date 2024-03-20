import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class FacebookButtonLink extends StatelessWidget {
  const FacebookButtonLink({super.key});

  @override
  Widget build(BuildContext context) {
    void onFacebookButtonPressed() async {
      final uri = Uri.parse('https://www.facebook.com/traktorgastrobar');
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
      onPressed: onFacebookButtonPressed,
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
          Text(S.of(context).writeOnFacebook),
        ],
      ),
    );
  }
}