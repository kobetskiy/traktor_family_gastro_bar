import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({
    super.key,
    required this.title,
    required this.content,
    required this.appBarTitle,
  });

  final String title;
  final String content;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: appBarTitle),
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                  Text(
                    title,
                    style: AppTextStyles.titleLarge.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                  Text(content, style: AppTextStyles.titleSmall),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
