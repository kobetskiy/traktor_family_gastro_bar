import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/services/favorite_meals_service.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/reserve_screens/reserve_contacts_widget.dart';
import 'package:traktor_family_gastro_bar/features/favorite/view/reserve_screens/reserve_time_widget.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/custom_stepper.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class ReserveScreen extends StatefulWidget {
  const ReserveScreen({super.key, required this.cartModelsList});

  final List<CartMealModel> cartModelsList;

  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> with OverlayLoader {
  int _currentStep = 0;
  PageController? _pageController;
  final favoriteMealsService = FavoriteMealsService();

  final timeFormKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final guestsNumberController = TextEditingController();
  final durationController = TextEditingController();

  final contactFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentStep);
    favoriteMealsService.loadUserData(nameController, phoneController);
  }

  void goToStep(int stepIndex) {
    _currentStep = stepIndex;
    setState(() {});
    _pageController?.animateToPage(
      stepIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToContact() {
    if (timeFormKey.currentState!.validate()) {
      goToStep(_currentStep + 1);
    }
  }

  Future<void> reserveMeals() async {
    try {
      if (contactFormKey.currentState!.validate()) {
        startLoading();
        await favoriteMealsService.updatePersonalInformationIfItChanged(
          nameController.text.trim(),
          phoneController.text.trim(),
        );
        if (!mounted) return;
        await favoriteMealsService.reserveMeals(
          context: context,
          cartModelsList: widget.cartModelsList,
          comment: commentController.text.trim(),
          reservationDate: dateController.text.trim(),
          reservationDuration: durationController.text.trim(),
          reservationTime: timeController.text.trim(),
          numberOfGuests: guestsNumberController.text.trim()
        );
        await stopLoading();
        if (!mounted) return;
        context.router.push(SendingResultRoute(
          title: 'S.of(context).theDeliveryHasBeenCompletedSuccessfully',
          subtitle: 'S.of(context).weWillCallYouInAFewMinutes',
        ));
      }
    } on Exception catch (e) {
      log(e.toString());
      context.router.push(
        SendingResultRoute(
          title: S.of(context).oopsSomethingWentWrong,
          subtitle: S.of(context).pleaseTryAgainLater,
          isSuccess: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    dateController.dispose();
    timeController.dispose();
    nameController.dispose();
    phoneController.dispose();
    guestsNumberController.dispose();
    durationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).deliveryRegistration),
          ],
          body: Column(
            children: [
              Expanded(
                child: CustomStepper(
                  steps: [
                    CustomStep(
                      icon: Icons.timer_outlined,
                      text: S.of(context).time,
                    ),
                    CustomStep(
                      icon: Icons.phone,
                      text: S.of(context).contacts,
                    ),
                  ],
                  content: [
                    ReserveTimeWidget(
                      formKey: timeFormKey,
                      dateController: dateController,
                      durationController: durationController,
                      guestsNumberController: guestsNumberController,
                      timeController: timeController,
                    ),
                    ReserveContactsWidget(
                      formKey: contactFormKey,
                      commentController: commentController,
                      nameController: nameController,
                      phoneController: phoneController,
                    )
                  ],
                  pageController: _pageController ?? PageController(),
                  currentStep: _currentStep,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentStep < 1)
                      Expanded(
                        child: PrimaryButton(
                          onPressed: goToContact,
                          child: Text(S.of(context).next),
                        ),
                      ),
                    if (_currentStep > 0)
                      Expanded(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () => goToStep(_currentStep - 1),
                              child: Text(S.of(context).back),
                            ),
                            PrimaryButton(
                              onPressed: reserveMeals,
                              child: Text(S.of(context).deliver),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
