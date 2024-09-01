import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> openLink(BuildContext context, Uri uri) async {
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      if (!context.mounted) return;
      await Constants.showAlertDialog(
        context: context,
        content: S.of(context).wrongLinkDialogText,
        actions: [
          TextButton(
            onPressed: context.router.maybePop,
            child: const Text('OK'),
          ),
        ],
      );
    }
  }

  final String creatorInstagram = 'https://www.instagram.com/kobetskiy.dev';
  final String instagramLink = 'https://www.instagram.com/traktor_gastrobar';
  final String facebookLink = 'https://www.facebook.com/traktorgastrobar';
  final String emailAddress = 'tractor.rest@gmail.com';
  final String emailScheme = 'mailto';
  final String phoneNumber = '+380936767646';
}
