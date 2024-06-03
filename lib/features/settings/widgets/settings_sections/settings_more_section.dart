import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';

import 'settings_section.dart';

class SettingsMoreSection extends StatelessWidget {
  const SettingsMoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsSection(
      children: [
        SettingsTile(
          title: 'Report a bug',
          subtitle: 'Write to us if you find a bug',
          child: ImageIcon(
            AssetImage(AppIcons.alert),
          ),
        ),
        Divider(height: 0),
        SettingsTile(
          title: 'Write a review',
          subtitle: 'Rate our app or service',
          child: ImageIcon(
            AssetImage(AppIcons.review),
          ),
        ),
        Divider(height: 0),
        SettingsTile(
          title: 'Privacy Policy',
          subtitle: 'Read this before using app',
          child: ImageIcon(
            AssetImage(AppIcons.privacy),
          ),
        ),
        Divider(height: 0),
        SettingsTile(
          title: 'FAQ',
          subtitle: 'Frequently asked question',
          child: ImageIcon(
            AssetImage(AppIcons.faq),
          ),
        ),
      ],
    );
  }
}
