import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/privacy_policy_screen.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';

import 'settings_section.dart';

class SettingsMoreSection extends StatelessWidget {
  const SettingsMoreSection({super.key});

  void pushTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      children: [
        const SettingsTile(
          title: 'Report a bug',
          subtitle: 'Write to us if you find a bug',
          child: ImageIcon(AssetImage(AppIcons.alert)),
        ),
        const Divider(height: 0),
        const SettingsTile(
          title: 'Write a review',
          subtitle: 'Rate our app or service',
          child: ImageIcon(AssetImage(AppIcons.review)),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: 'Privacy policy',
          subtitle: 'Read this before using app',
          child: const ImageIcon(AssetImage(AppIcons.privacy)),
          onTap: () => pushTo(context, const PrivacyPolicyScreen()),
        ),
        const Divider(height: 0),
        const SettingsTile(
          title: 'FAQ',
          subtitle: 'Frequently asked question',
          child: ImageIcon(AssetImage(AppIcons.faq)),
        ),
      ],
    );
  }
}
