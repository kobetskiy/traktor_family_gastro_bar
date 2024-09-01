import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_sections/settings_section.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class SettingsMainSection extends StatelessWidget {
  const SettingsMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final iconsColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87
        : Colors.white;

    return SettingsSection(
      children: [
        SettingsTile(
          title: S.of(context).notifications,
          subtitle: S.of(context).setUpNotifications,
          child: ImageIcon(const AssetImage(AppIcons.notification),
              color: iconsColor),
          onTap: () => context.router.push(const NotificationRoute()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).language,
          subtitle: S.of(context).customizeLanguage,
          child:
              ImageIcon(const AssetImage(AppIcons.language), color: iconsColor),
          onTap: () => context.router.push(const LanguageRoute()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).theme,
          subtitle: S.of(context).selectTheApplicationTheme,
          onTap: () => context.router.push(const ThemeRoute()),
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
