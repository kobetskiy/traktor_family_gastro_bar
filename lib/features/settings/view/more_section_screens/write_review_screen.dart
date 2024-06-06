import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/rating_bar.dart';
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
                  "Оцініть наш сервіс",
                  style: AppTextStyles.titleLarge.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 20),
                const _RatingBarWidget(),
                const SizedBox(height: 30),
                _ReviewTextField(controller: controller),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
        onPressed: () {},
        child: const Text('Send'),
      ),
    );
  }
}

class _ReviewTextField extends StatelessWidget {
  const _ReviewTextField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyles.titleSmall,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: 'Зауваження або побажання',
        hintStyle:
            AppTextStyles.titleSmall.copyWith(color: AppColors.subtitleColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.titleColor),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear_rounded),
          color: AppColors.subtitleColor,
          onPressed: () => controller.clear(),
        ),
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
