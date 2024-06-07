import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/rating_bar.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final controller = TextEditingController();

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  S.of(context).rateOurService,
                  style: AppTextStyles.titleLarge.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 20),
                const _RatingBarWidget(),
                const SizedBox(height: 30),
                SettingsTextField(
                  controller: controller,
                  hintText: S.of(context).remarksOrWishes,
                ),
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

class _RatingBarWidget extends StatelessWidget {
  const _RatingBarWidget();

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemPadding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star_rate_rounded,
          color: AppColors.primaryColor,
        );
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
