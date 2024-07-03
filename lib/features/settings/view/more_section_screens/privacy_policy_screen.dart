import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).privacyPolicy),
          ],
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              Point(
                title: S.of(context).privacy_policy_1,
                content: S.of(context).privacy_policy_1_content,
              ),
              const SizedBox(height: 20),
              Point(
                title: S.of(context).privacy_policy_2,
                content: S.of(context).privacy_policy_2_content,
              ),
              const SizedBox(height: 20),
              Point(
                title: S.of(context).privacy_policy_3,
                content: S.of(context).privacy_policy_3_content,
              ),
              const SizedBox(height: 20),
              Point(
                title: S.of(context).privacy_policy_4,
                content: S.of(context).privacy_policy_4_content,
              ),
              const SizedBox(height: 20),
              Point(
                title: S.of(context).privacy_policy_5,
                content: S.of(context).privacy_policy_5_content,
              ),
              const SizedBox(height: 20),
              Point(
                title: S.of(context).privacy_policy_6,
                content: S.of(context).privacy_policy_6_content,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}

class Point extends StatelessWidget {
  const Point({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 20),
        Text(content, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
