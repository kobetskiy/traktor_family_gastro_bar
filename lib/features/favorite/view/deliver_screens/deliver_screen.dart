import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/models/cart_meal_model.dart';
import 'package:traktor_family_gastro_bar/features/favorite/data/services/favorite_meals_service.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/custom_stepper.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import 'delivery_address_widget.dart';
import 'delivery_contacts_widget.dart';

@RoutePage()
class DeliverScreen extends StatefulWidget {
  const DeliverScreen({super.key, required this.cartModelsList});

  final List<CartMealModel> cartModelsList;

  @override
  State<DeliverScreen> createState() => _DeliverScreenState();
}

class _DeliverScreenState extends State<DeliverScreen> with OverlayLoader {
  int _currentStep = 0;
  PageController? _pageController;
  int tip = 0;
  final auth = FirebaseAuth.instance;
  final favoriteMealsService = FavoriteMealsService();

  final addressFormKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  final contactFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentStep);
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (auth.currentUser != null) {
      final userData = await AuthService.getUserData();
      if (userData != null) {
        nameController.text = userData.name;
        phoneController.text = userData.phoneNumber?.substring(4) ?? '';
      }
    }
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
    if (addressFormKey.currentState!.validate()) {
      goToStep(_currentStep + 1);
    }
  }

  Future<void> deliverMeals() async {
    try {
      if (contactFormKey.currentState!.validate()) {
        startLoading();
        await AuthService.updatePersonalInformation(
          nameController.text.trim(),
          phoneController.text.trim(),
        );
        if (!mounted) return;
        await favoriteMealsService.deliverMeals(
          context: context,
          cartModelsList: widget.cartModelsList,
          address: addressController.text.trim(),
          commentToAddess: commentController.text.trim(),
          tip: "$tip%",
        );
        await stopLoading();
        if (!mounted) return;
        context.router.push(SendingResultRoute(
          title: S.of(context).theDeliveryHasBeenCompletedSuccessfully,
          subtitle: S.of(context).weWillCallYouInAFewMinutes,
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
    addressController.dispose();
    commentController.dispose();
    nameController.dispose();
    phoneController.dispose();

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
                      icon: Icons.location_on_outlined,
                      text: S.of(context).address,
                    ),
                    CustomStep(
                      icon: Icons.phone,
                      text: S.of(context).contacts,
                    ),
                  ],
                  content: [
                    DeliveryAddressWidget(
                      formKey: addressFormKey,
                      addressController: addressController,
                      commentController: commentController,
                    ),
                    DeliveryContactsWidget(
                      formKey: contactFormKey,
                      nameController: nameController,
                      phoneController: phoneController,
                      onTipSelected: (value) {
                        tip = value;
                        setState(() {});
                      },
                    ),
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
                              onPressed: deliverMeals,
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
