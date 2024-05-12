import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/adaptive_alert_dialog.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButtonService {
  void openLink(BuildContext context, Uri uri) async {
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

  final String instagramLink = 'https://www.instagram.com/traktor_gastrobar/';
  final String facebookLink = 'https://www.facebook.com/traktorgastrobar';
  final String emailAddress = 'tractor.rest@gmail.com';
  final String emailScheme = 'mailto';
  final String phoneNumber = '+380936767646';
}
