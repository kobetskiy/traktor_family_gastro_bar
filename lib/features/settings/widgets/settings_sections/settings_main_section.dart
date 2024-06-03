import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_sections/settings_section.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';

class SettingsMainSection extends StatelessWidget {
  const SettingsMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsSection(
      children: [
        SettingsTile(
          title: 'Personal information',
          subtitle: 'Change account information',
          child: ImageIcon(
            AssetImage(AppIcons.profile),
          ),
        ),
        Divider(height: 0),
        SettingsTile(
          title: 'Notifications',
          subtitle: 'Set up notifications',
          child: ImageIcon(
            AssetImage(AppIcons.notification),
          ),
        ),
        Divider(height: 0),
        SettingsTile(
          title: 'Language',
          subtitle: 'Customize language',
          child: ImageIcon(
            AssetImage(AppIcons.language),
          ),
        ),
        Divider(height: 0),
        SettingsTile(
          title: 'Dark theme',
          subtitle: 'Select the application theme',
          child: ImageIcon(
            AssetImage(AppIcons.lightTheme),
          ),
        ),
      ],
    );
  }
}
