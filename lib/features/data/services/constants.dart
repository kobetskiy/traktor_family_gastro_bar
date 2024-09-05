import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/theme.dart';
import 'package:traktor_family_gastro_bar/features/widgets/adaptive_alert_dialog.dart';

abstract class Constants {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required List<Widget> actions,
    String? title,
    String? content,
  }) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  }

  static showSnackBar(
    BuildContext context,
    String text,
    Icon icon,
  ) {
    final snackBar = SnackBar(
      elevation: 7,
      showCloseIcon: true,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      content: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Flexible(child: Text(text)),
        ],
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Icon failureIcon(BuildContext context) => Icon(
        Icons.error_outline_rounded,
        color: Theme.of(context).colorScheme.error,
      );

  static Icon successIcon(BuildContext context) => Icon(
        Icons.check_circle_outline_rounded,
        color: Theme.of(context).colorScheme.success,
      );
}
