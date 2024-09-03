import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/data/services/constants.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen>
    with OverlayLoader {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> logOutAlertDialog() async {
    await Constants.showAlertDialog(
      context: context,
      title: S.of(context).wantToLogOut,
      content: S.of(context).areYouSureYouWantToLog,
      actions: [
        TextButton(
          onPressed: context.router.maybePop,
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () async {
            startLoading();
            await AuthService.logOut(context: context);
            stopLoading();
          },
          child: Text(S.of(context).yes),
        ),
      ],
    );
  }

  Future<void> unsavedDataAlertDialog() async {
    final userData = await AuthService.getUserData();
    final currentName = userData!.name;
    final currentPhone = userData.phoneNumber;

    if (!mounted) return;
    if (nameController.text.trim() != currentName ||
        '+380${phoneController.text.trim()}' != currentPhone) {
      await Constants.showAlertDialog(
        context: context,
        title: S.of(context).noDataSaved,
        content: S.of(context).areYouSureYouWantToLeaveThisPageWithout,
        actions: [
          TextButton(
            onPressed: context.router.maybePop,
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              context.router.popUntilRouteWithPath('/');
            },
            child: Text(S.of(context).yes),
          ),
        ],
      );
    } else {
      context.router.maybePop();
    }
  }

  Future<void> updatePersonalInformation() async {
    if (_formKey.currentState!.validate()) {
      startLoading();
      if (nameController.text.trim() != auth.currentUser!.displayName) {
        await AuthService.updateName(
          auth.currentUser!,
          nameController.text.trim(),
        );
      }
      final userData = await AuthService.getUserData();
      if (phoneController.text.trim() != userData?.phoneNumber) {
        await AuthService.updatePhoneNumber(
          auth.currentUser!,
          phoneController.text.trim(),
        );
      }
      stopLoading();
      if (!mounted) return;
      context.router.replaceAll([const AppRoute()]);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (auth.currentUser != null) {
      final userData = await AuthService.getUserData();
      if (userData != null) {
        nameController.text = userData.name;
        emailController.text = userData.email;
        phoneController.text = userData.phoneNumber?.substring(4) ?? '';
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
            AppBarWidget(
              title: S.of(context).personalInformation,
              leading: BackButton(
                onPressed: () async => await unsavedDataAlertDialog(),
              ),
              actions: [
                IconButton(
                  onPressed: updatePersonalInformation,
                  icon: const Icon(Icons.check_rounded),
                )
              ],
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    Text(S.of(context).email,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    SettingsTextField.form(
                      controller: emailController,
                      enabled: false,
                      hintText: "example@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      validator: TextFieldValidator.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    Text(S.of(context).name,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    SettingsTextField.form(
                      controller: nameController,
                      enabled: isLoggedIn,
                      hintText: S.of(context).enterYourName,
                      keyboardType: TextInputType.name,
                      validator: TextFieldValidator.validateName,
                    ),
                    const SizedBox(height: 20),
                    Text(S.of(context).phoneNumber,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    SettingsTextField.form(
                      controller: phoneController,
                      enabled: isLoggedIn,
                      hintText: "*********",
                      keyboardType: TextInputType.phone,
                      validator: TextFieldValidator.validatePhone,
                      prefix: "+380",
                    ),
                    !isLoggedIn
                        ? Column(
                            children: [
                              const SizedBox(height: 20),
                              Center(
                                child: Text(
                                  S
                                      .of(context)
                                      .youAreNotAuthorizedSoYouCannotChangePersonalInfo,
                                  style: TextStyle(color: Colors.red[400]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(S.of(context).logIn),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryButton(
          backgroundColor: Theme.of(context).colorScheme.error,
          onPressed: () async => await logOutAlertDialog(),
          child: Text(S.of(context).logOut),
        ),
      ),
    );
  }
}
