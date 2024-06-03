import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.onTap,
    this.trailing = const Icon(Icons.arrow_forward_ios_rounded),
  });

  final String title;
  final Widget child;
  final String? subtitle;
  final Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      title: Text(title),
      titleTextStyle: AppTextStyles.titleSmall,
      subtitle: subtitle != null ? Text(subtitle!) : null,
      subtitleTextStyle: AppTextStyles.subtitle.copyWith(
        color: AppColors.subtitleColor,
      ),
      leading: SizedBox(
        width: 24,
        height: 24,
        child: child,
      ),
      trailing: trailing,
      iconColor: AppColors.titleColor,
      onTap: trailing.runtimeType != Switch ? () {} : null, // ! check this
    );
  }
}
