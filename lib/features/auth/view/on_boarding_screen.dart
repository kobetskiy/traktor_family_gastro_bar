import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final pageController = PageController();
  late TabController selectorController;

  Future<void> logIn() async {
    context.router.push(const LogInRoute());
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasOnBoardingShown', true);
  }

  Future<void> signUp() async {
    context.router.push(const SignUpRoute());
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView(
                      onPageChanged: (index) =>
                          selectorController.index = index,
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
            Positioned(
              right: 15,
              top: 10,
              child: CupertinoButton(
                onPressed: () => context.router.replace(
                    const AppRoute()), // TODO: fix navigation. app navigate user to the current screen, it shows cuz AppRoute has AuthGuard that shows Onboarding screen, but we tryna navigate to AppRoute that also has AuthGuard and so on
                child: Text(
                  S.of(context).skip,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
            ),
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
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: image,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),
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
    );
  }
}
