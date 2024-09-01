import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/images_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class SendingResultScreen extends StatelessWidget {
  const SendingResultScreen({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSuccess = true,
  });

  final String title;
  final String subtitle;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSuccess
                ? Image.asset(AppImages.success)
                : Image.asset(AppImages.failure),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
        onPressed: () => context.router.popUntilRouteWithPath('/'),
        child: Text(S.of(context).goBack),
      ),
    );
  }
}
