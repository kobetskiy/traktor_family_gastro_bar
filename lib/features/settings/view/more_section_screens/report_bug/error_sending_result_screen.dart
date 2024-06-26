import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/images_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ErrorSendingResult extends StatelessWidget {
  const ErrorSendingResult.success({super.key}) : isSuccess = true;
  const ErrorSendingResult.failure({super.key}) : isSuccess = false;

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
            Text(
                isSuccess
                    ? S.of(context).thankYou
                    : S.of(context).oopsSomethingWentWrong,
                style: AppTextStyles.titleLarge),
            const SizedBox(height: 10),
            Text(
              isSuccess
                  ? S.of(context).weWillFixThisErrorAsSoonAsPossible
                  : S.of(context).weAreAlreadyFixingThisBugPleaseTryAgainLater,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleSmall
                  .copyWith(color: AppColors.subtitleColor),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AppScreen()),
          (route) => false,
        ),
        child: const Text("Повернутися назад"),
      ),
    );
  }
}
