import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ContactUsButtonContent extends StatelessWidget {
  const ContactUsButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 38,
          width: 38,
          child: Image.asset(AppIcons.outlinedPhone),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).haveAQuestionContactUs,
                style: AppTextStyles.titleSmall),
            const SizedBox(height: 3),
            Text(
              S.of(context).from10amTo9pmFreeInUkraine,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.subtitleColor),
            ),
          ],
        ),
      ],
    );
  }
}
