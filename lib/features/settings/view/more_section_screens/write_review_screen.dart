import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/services/review_service.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/rating_bar.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/features/widgets/overlay_loader.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen>
    with OverlayLoader {
  final reviewController = TextEditingController();
  final reviewService = ReviewService();
  final _formKey = GlobalKey<FormState>();
  double rating = 0;

  Future<void> sendReviewToFirebase() async {
    if (_formKey.currentState!.validate()) {
      startLoading();
      await reviewService.sendReviewToFirebase(
        context: context,
        rating: rating,
        text: reviewController.text.trim(),
      );
      reviewController.clear();
      setState(() {});
      stopLoading();
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
            AppBarWidget(title: S.of(context).writeAReview),
          ],
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                Text(
                  S.of(context).rateOurService,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 22),
                ),
                const SizedBox(height: 20),
                RatingBar.builder(
                  itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rate_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  onRatingUpdate: (value) => rating = value,
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: SettingsTextField.formMultiline(
                    controller: reviewController,
                    hintText: S.of(context).remarksOrWishes,
                    validator: (String? value) =>
                        value == null || value.trim().isEmpty
                            ? S.of(context).pleaseWriteRemarksOrWishes
                            : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryButton(
          onPressed: () async => await sendReviewToFirebase(),
          child: Text(S.of(context).submit),
        ),
      ),
    );
  }
}
