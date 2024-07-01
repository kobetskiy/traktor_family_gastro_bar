// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/services/review_service.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/rating_bar.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/sending_result_screen.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/features/widgets/overlay_loader.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen>
    with OverlayLoader {
  final reviewController = TextEditingController();
  final reviewService = ReviewService();
  double rating = 0;

  Future<void> sendReviewToFirebase() async {
    try {
      startLoading();
      await reviewService.sendReview(
        text: reviewController.text,
        rating: rating,
      );
      stopLoading();
      if (mounted) {
        reviewService.navigateTo(
          context,
          SendingResultScreen.success(
            title: S.of(context).thankYouForYourFeedback,
            subtitle: S.of(context).weTryToImproveOurServiceEveryDay,
          ),
        );
      }
      reviewController.clear();
      rating = 0;
      setState(() {});
    } catch (e) {
      stopLoading();
      if (mounted) {
        reviewService.navigateTo(
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
                  style: AppTextStyles.titleLarge.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 20),
                RatingBar.builder(
                  itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.primaryColor,
                  ),
                  onRatingUpdate: (value) => rating = value,
                ),
                const SizedBox(height: 30),
                SettingsTextField(
                  controller: reviewController,
                  hintText: S.of(context).remarksOrWishes,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
        onPressed: () async {
          await sendReviewToFirebase();
        },
        child: Text(S.of(context).submit),
      ),
    );
  }
}
