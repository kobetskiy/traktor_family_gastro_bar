import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';

import 'widgets.dart';

class AuthSocialMediaButtonRow extends StatelessWidget {
  const AuthSocialMediaButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthSocialMediaButton(
          icon: AppIcons.google,
          onPressed: () => AuthService.signInWithGoogle(context),
        ),
        const SizedBox(width: 25),
        AuthSocialMediaButton(
          icon: AppIcons.facebookLetter,
          onPressed: () => AuthService.signInWithFacebook(context),
        ),
        const SizedBox(width: 25),
        AuthSocialMediaButton(
          icon: Theme.of(context).brightness == Brightness.dark
              ? AppIcons.appleLight
              : AppIcons.appleDark,
          onPressed: () {},
        ),
      ],
    );
  }
}