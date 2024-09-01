import 'package:flutter/material.dart';
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
}