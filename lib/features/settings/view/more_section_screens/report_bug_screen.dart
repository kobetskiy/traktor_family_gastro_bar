import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ReportBugScreen extends StatefulWidget {
  const ReportBugScreen({super.key});

  @override
  State<ReportBugScreen> createState() => _ReportBugScreenState();
}

class _ReportBugScreenState extends State<ReportBugScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).reportABug),
          ],
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  S.of(context).foundAnError,
                  style: AppTextStyles.titleLarge.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).notifyUsOfAnErrorInTheOperationOfApp,
                  style: AppTextStyles.subtitle
                      .copyWith(color: AppColors.subtitleColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                SettingsTextField(
                  controller: controller,
                  hintText: S.of(context).describeTheProblem,
                ),
                const SizedBox(height: 30),
                PrimaryButton.outlined(
                  onPressed: () {},
                  child: Text(S.of(context).addAPhoto),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
        onPressed: () {},
        child: Text(S.of(context).send),
      ),
    );
  }
}
