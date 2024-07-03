import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFE1E1E1)
          : const Color(0xFF1E1E1E),
        elevation: 7,
        child: Column(children: children),
      ),
    );
  }
}
