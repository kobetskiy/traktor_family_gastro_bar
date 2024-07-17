import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/app_screen.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

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

  Future<void> logOut() async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: S.of(context).wantToLogOut,
        content: S.of(context).areYouSureYouWantToLog,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
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
      ),
    );
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
      stopLoading();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = auth.currentUser!.displayName!;
    emailController.text = auth.currentUser!.email!;
    phoneController.text = auth.currentUser!.phoneNumber ?? '';
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
                                  S.of(context).youAreNotAuthorized,
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
      floatingActionButton: PrimaryButton(
        backgroundColor: Theme.of(context).colorScheme.error,
        onPressed: logOut,
        child: Text(S.of(context).logOut),
      ),
    );
  }
}
