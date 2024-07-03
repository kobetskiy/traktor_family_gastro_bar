import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/main_section_screens/main_section_screens.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_sections/settings_section.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class SettingsMainSection extends StatelessWidget {
  const SettingsMainSection({super.key});

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconsColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87
        : Colors.white;

    return SettingsSection(
      children: [
        SettingsTile(
          title: S.of(context).personalInformation,
          subtitle: S.of(context).changeAccountInformation,
          onTap: () => navigateTo(context, const PersonalInformationScreen()),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: ImageIcon(
            const AssetImage(AppIcons.profile),
            color: iconsColor,
          ),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).notifications,
          subtitle: S.of(context).setUpNotifications,
          child: ImageIcon(const AssetImage(AppIcons.notification),
              color: iconsColor),
          onTap: () => navigateTo(context, const NotificationScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).language,
          subtitle: S.of(context).customizeLanguage,
          child:
              ImageIcon(const AssetImage(AppIcons.language), color: iconsColor),
          onTap: () => navigateTo(context, const LanguageScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).theme,
          subtitle: S.of(context).selectTheApplicationTheme,
          onTap: () => navigateTo(context, const ThemeScreen()),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: ImageIcon(
            const AssetImage(AppIcons.lightTheme),
            color: iconsColor,
          ),
        ),
      ],
    );
  }
}
