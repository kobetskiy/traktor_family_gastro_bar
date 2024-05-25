import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _CupertinoAlertDialogWidget(content)
        : _MaterialAlertDialogWidget(content);
  }
}

class _CupertinoAlertDialogWidget extends StatelessWidget {
  const _CupertinoAlertDialogWidget(this.content);

  final String content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          child: const Text('OK'),
        )
      ],
    );
  }
}

class _MaterialAlertDialogWidget extends StatelessWidget {
  const _MaterialAlertDialogWidget(this.content);

  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        S.of(context).wrongLinkDialogText,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        )
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
