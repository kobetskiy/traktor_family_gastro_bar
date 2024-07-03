import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.customBorder,
  });

  final String title;
  final Widget child;
  final String? subtitle;
  final Function()? onTap;
  final Widget? trailing;
  final ShapeBorder? customBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: customBorder,
      onTap: trailing.runtimeType != Switch ? onTap : null, // ! check this
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        title: Text(title),
        titleTextStyle: Theme.of(context).textTheme.titleSmall,
        subtitle: subtitle != null ? Text(subtitle!) : null,
        subtitleTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey[600],
            ),
        leading: SizedBox(
          width: 24,
          height: 24,
          child: child,
        ),
        trailing: trailing ??
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black87
                  : Colors.white,
            ),
        iconColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.black87
                  : Colors.white,
            ),
    );
  }
}
