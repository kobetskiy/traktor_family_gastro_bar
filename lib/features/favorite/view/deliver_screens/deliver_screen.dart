// import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
// import 'package:traktor_family_gastro_bar/features/favorite/widgets/custom_stepper.dart';
// import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
// import 'package:traktor_family_gastro_bar/generated/l10n.dart';

// import 'delivery_address_widget.dart';
// import 'delivery_contacts_widget.dart';

// @RoutePage()
// class DeliverScreen extends StatefulWidget {
//   const DeliverScreen({super.key});

//   @override
//   State<DeliverScreen> createState() => _DeliverScreenState();
// }

// class _DeliverScreenState extends State<DeliverScreen> {
//   int _currentStep = 0;
//   PageController? _pageController;
//   final addressController = TextEditingController();
//   final commentController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentStep);
//   }

//   void _goToStep(int stepIndex) {
//     _currentStep = stepIndex;
//     setState(() {});
//     _pageController?.animateToPage(
//       stepIndex,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   void goToContact() {
//     if (addressController.text.trim().isEmpty ||
//         commentController.text.trim().isEmpty) {
//       Constants.showSnackBar(
//         context: context,
//         text: "Fill all fields",
//         icon: Constants.failureIcon(context),
//         margin: const EdgeInsets.fromLTRB(20, 0, 20, 100),
//       );
//     } else {
//       _goToStep(_currentStep + 1);
//     }
//   }

//   @override
//   void dispose() {
//     _pageController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             AppBarWidget(title: S.of(context).deliveryRegistration),
//           ],
//           body: Column(
//             children: [
//               Expanded(
//                 child: CustomStepper(
//                   steps: [
//                     CustomStep(
//                       icon: Icons.location_on_outlined,
//                       text: S.of(context).address,
//                     ),
//                     CustomStep(
//                       icon: Icons.phone,
//                       text: S.of(context).contacts,
//                     ),
//                   ],
//                   content: [
//                     DeliveryAddressWidget(
//                       addressController: addressController,
//                       commentController: commentController,
//                     ),
//                     const DeliveryContactsWidget(),
//                   ],
//                   pageController: _pageController ?? PageController(),
//                   currentStep: _currentStep,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     if (_currentStep < 1)
//                       Expanded(
//                         child: PrimaryButton(
//                           onPressed: goToContact,
//                           child: Text(S.of(context).next),
//                         ),
//                       ),
//                     if (_currentStep > 0)
//                       Expanded(
//                         child: Column(
//                           children: [
//                             TextButton(
//                               onPressed: () => _goToStep(_currentStep - 1),
//                               child: Text(S.of(context).back),
//                             ),
//                             PrimaryButton(
//                               onPressed: () => log("deliver"),
//                               child: Text(S.of(context).deliver),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/custom_stepper.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import 'delivery_address_widget.dart';
import 'delivery_contacts_widget.dart';

@RoutePage()
class DeliverScreen extends StatefulWidget {
  const DeliverScreen({super.key});

  @override
  State<DeliverScreen> createState() => _DeliverScreenState();
}

class _DeliverScreenState extends State<DeliverScreen> {
  int _currentStep = 0;
  PageController? _pageController;
  final addressController = TextEditingController();
  final commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentStep);
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
    if (formKey.currentState!.validate()) {
      goToStep(_currentStep + 1);
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
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
                      formKey: formKey,
                      addressController: addressController,
                      commentController: commentController,
                    ),
                    const DeliveryContactsWidget(),
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
                              onPressed: () => log("deliver"),
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
