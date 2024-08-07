import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import 'auth_screens.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final pageController = PageController();
  late TabController selectorController;

  void navigateTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<void> logIn() async {
    navigateTo(const LogInScreen());
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasOnBoardingShown', true);
  }

  Future<void> signUp() async {
    navigateTo(const SignUpScreen());
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasOnBoardingShown', true);
  }

  @override
  void initState() {
    super.initState();
    selectorController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index) => selectorController.index = index,
                controller: pageController,
                children: [
                  _OnBoardingContent(
                    title: S.of(context).discoverOurWorldOfTastes,
                    subtitle: S.of(context).experienceUniqueDishes,
                    image: Image.asset(AppImages.visitor, width: 300),
                  ),
                  _OnBoardingContent(
                    title: S.of(context).convenientTableReservations,
                    subtitle: S.of(context).easilyFindYourFavoriteDishes,
                    image: Image.asset(AppImages.cook, width: 300),
                  ),
                  _OnBoardingContent(
                    title: S.of(context).fastDeliveryToYourHome,
                    subtitle: S.of(context).areYouHungry,
                    image: Image.asset(AppImages.delivery, width: 300),
                  ),
                ],
              ),
            ),
            _OnBoardingPageSelectors(controller: selectorController),
            const SizedBox(height: 55),
            PrimaryButton(
              onPressed: signUp,
              child: Text(S.of(context).createAccount),
            ),
            const SizedBox(height: 10),
            PrimaryButton.outlined(
              onPressed: logIn,
              child: Text(S.of(context).logIn),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _OnBoardingPageSelectors extends StatelessWidget {
  const _OnBoardingPageSelectors({required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TabPageSelector(controller: controller),
    );
  }
}

class _OnBoardingContent extends StatelessWidget {
  const _OnBoardingContent({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          image,
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
