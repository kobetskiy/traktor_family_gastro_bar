import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/main_section_screens/main_section_screens.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_sections/settings_section.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class SettingsMainSection extends StatelessWidget {
  const SettingsMainSection({super.key});

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
        SettingsTile(
          title: S.of(context).personalInformation,
          subtitle: S.of(context).changeAccountInformation,
          child: const ImageIcon(AssetImage(AppIcons.profile)),
          onTap: () => pushTo(context, const PersonalInformationScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).notifications,
          subtitle: S.of(context).setUpNotifications,
          child: const ImageIcon(AssetImage(AppIcons.notification)),
          onTap: () => pushTo(context, const NotificationScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).language,
          subtitle: S.of(context).customizeLanguage,
          child: const ImageIcon(AssetImage(AppIcons.language)),
          onTap: () => pushTo(context, const LanguageScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).theme,
          subtitle: S.of(context).selectTheApplicationTheme,
          child: const ImageIcon(AssetImage(AppIcons.lightTheme)),
          onTap: () => pushTo(context, const ThemeScreen()),
        ),
      ],
    );
  }
}
