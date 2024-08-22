import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/services/error_service.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
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

  Future<void> removeImage() async {
    await Constants.showAlertDialog(
      context: context,
      title: S.of(context).areYouSure,
      content: S.of(context).thisPhotoWillBeRemoved,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            image = null;
            Navigator.pop(context);
            setState(() {});
          },
          child: Text(S.of(context).yes),
        ),
      ],
    );
  }

  Future<void> pickImage() async {
    image = await errorService.pickImage();
    setState(() {});
  }

  Future<void> sendErrorToFirebase() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      await errorService.sendErrorToFirebase(
        context: context,
        text: errorController.text.trim(),
        image: image,
      );
      errorController.clear();
      setState(() {});
      stopLoading();
    }
  }

  @override
  void dispose() {
    errorController.dispose();
    super.dispose();
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    S.of(context).notifyUsOfAnErrorInTheOperationOfApp,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Form(
                    key: formKey,
                    child: SettingsTextField.formMultiline(
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
                          onDeleteButtonPressed: () async => await removeImage(),
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
        onPressed: () async => await sendErrorToFirebase(),
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
