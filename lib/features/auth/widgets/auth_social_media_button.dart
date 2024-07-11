import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';

class AuthSocialMediaButton extends StatelessWidget {
  const AuthSocialMediaButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final String icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton.outlined(
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(15),
      borderRadius: 50,
      onPressed: onPressed,
      child: Image.asset(icon),
    );
  }
}
