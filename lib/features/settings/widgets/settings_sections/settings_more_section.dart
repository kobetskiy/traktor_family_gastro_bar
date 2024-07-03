import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/view/more_section_screens/more_section_screens.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_tile.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

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
    final iconsColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87
        : Colors.white;

    return SettingsSection(
      children: [
        SettingsTile(
          title: S.of(context).reportABug,
          subtitle: S.of(context).writeToUsIfYouFindABug,
          onTap: () => pushTo(context, const ReportBugScreen()),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: ImageIcon(
            const AssetImage(AppIcons.alert),
            color: iconsColor,
          ),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).writeAReview,
          subtitle: S.of(context).rateOurAppAndService,
          child: ImageIcon(
            const AssetImage(AppIcons.review),
            color: iconsColor,
          ),
          onTap: () => pushTo(context, const WriteReviewScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).privacyPolicy,
          subtitle: S.of(context).readThisBeforeUsingApp,
          child: ImageIcon(
            const AssetImage(AppIcons.privacy),
            color: iconsColor,
          ),
          onTap: () => pushTo(context, const PrivacyPolicyScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).faq,
          subtitle: S.of(context).frequentlyAskedQuestion,
          onTap: () => pushTo(context, const FAQScreen()),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: ImageIcon(
            const AssetImage(AppIcons.faq),
            color: iconsColor,
          ),
        ),
      ],
    );
  }
}
