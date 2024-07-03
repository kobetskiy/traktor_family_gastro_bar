import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({
    super.key,
    required this.actions,
    this.title,
    this.content,
  }) : assert(title != null, content != null);

  final String? title;
  final String? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _CupertinoAlertDialogWidget(title, content, actions)
        : _MaterialAlertDialogWidget(title, content, actions);
  }
}

class _CupertinoAlertDialogWidget extends StatelessWidget {
  const _CupertinoAlertDialogWidget(this.title, this.content, this.actions);

  final String? title;
  final String? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          : null,
      content: content != null
          ? Text(content!, style: const TextStyle(fontSize: 16))
          : null,
      actions: actions,
    );
  }
}

class _MaterialAlertDialogWidget extends StatelessWidget {
  const _MaterialAlertDialogWidget(this.title, this.content, this.actions);

  final String? title;
  final String? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white,
              ),
            )
          : null,
      content: content != null
          ? Text(
              content!,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white,
              ),
            )
          : null,
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
