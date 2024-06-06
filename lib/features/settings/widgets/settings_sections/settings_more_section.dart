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
    return SettingsSection(
      children: [
        SettingsTile(
          title: S.of(context).reportABug,
          subtitle: S.of(context).writeToUsIfYouFindABug,
          child: const ImageIcon(AssetImage(AppIcons.alert)),
          onTap: () => pushTo(context, const ReportBugScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).writeAReview,
          subtitle: S.of(context).rateOurAppAndService,
          child: const ImageIcon(AssetImage(AppIcons.review)),
          onTap: () => pushTo(context, const WriteReviewScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).privacyPolicy,
          subtitle: S.of(context).readThisBeforeUsingApp,
          child: const ImageIcon(AssetImage(AppIcons.privacy)),
          onTap: () => pushTo(context, const PrivacyPolicyScreen()),
        ),
        const Divider(height: 0),
        SettingsTile(
          title: S.of(context).faq,
          subtitle: S.of(context).frequentlyAskedQuestion,
          child: const ImageIcon(AssetImage(AppIcons.faq)),
          onTap: () => pushTo(context, const FAQScreen()),
        ),
      ],
    );
  }
}
