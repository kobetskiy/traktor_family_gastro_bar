import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons.dart';

class ContactUsButtonContent extends StatelessWidget {
  const ContactUsButtonContent({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 36,
          width: 36,
          child: Image.asset(AppIcons.outlinedPhone),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Have a question? Contact us!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 3),
            Text(
              'From 10am to 9pm free in Ukraine',
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
