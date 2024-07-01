import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/services/error_service.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/sending_result_screen.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/adaptive_alert_dialog.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/features/widgets/overlay_loader.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ReportBugScreen extends StatefulWidget {
  const ReportBugScreen({super.key});

  @override
  State<ReportBugScreen> createState() => _ReportBugScreenState();
}

class _ReportBugScreenState extends State<ReportBugScreen> with OverlayLoader {
  final errorController = TextEditingController();
  final errorService = ErrorService();
  final formKey = GlobalKey<FormState>();
  Uint8List? image;

  void removeImage() {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: 'Are you sure?',
        content: "This photo will be removed",
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              image = null;
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    image = await errorService.pickImage();
    setState(() {});
  }

  Future<void> sendErrorToFirebase() async {
    try {
      startLoading();
      await errorService.sendError(
        text: errorController.text,
        image: image,
      );
      stopLoading();
      if (mounted) {
        errorService.navigateTo(
          context,
          SendingResultScreen.success(
            title: S.of(context).thankYou,
            subtitle: S.of(context).weWillFixThisErrorAsSoonAsPossible,
          ),
        );
      }
      errorController.clear();
      image = null;
      setState(() {});
    } catch (e) {
      stopLoading();
      if (mounted) {
        errorService.navigateTo(
          context,
          SendingResultScreen.failure(
            title: S.of(context).oopsSomethingWentWrong,
            subtitle:
                S.of(context).weAreAlreadyFixingThisBugPleaseTryAgainLater,
          ),
        );
      }
    }
  }

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
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
                  Form(
                    key: formKey,
                    child: SettingsTextField.form(
                      controller: errorController,
                      hintText: S.of(context).describeTheProblem,
                      validator: (String? value) {
                        return errorService.validate(context, value);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  image != null
                      ? _PickedImageWidget(
                          image: image,
                          onDeleteButtonPressed: removeImage,
                        )
                      : PrimaryButton.outlined(
                          onPressed: pickImage,
                          child: Text(S.of(context).addAPhoto),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
        onPressed: () async {
          formKey.currentState!.validate();
          if (errorController.text != '') {
            await sendErrorToFirebase();
          }
        },
        child: Text(S.of(context).submit),
      ),
    );
  }
}

class _PickedImageWidget extends StatelessWidget {
  const _PickedImageWidget({
    required this.image,
    required this.onDeleteButtonPressed,
  });

  final Uint8List? image;
  final void Function()? onDeleteButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Image.memory(image!, height: 280, width: 300),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: onDeleteButtonPressed,
            icon: const ImageIcon(AssetImage(AppIcons.trash)),
          ),
        ),
      ],
    );
  }
}
