import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/settings/widgets/settings_text_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
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
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final phoneControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;

  Future<void> logOut() async {
    startLoading();
    await AuthService.logOut(context: context);
    stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).personalInformation),
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
                      controller: nameControler,
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
                      controller: emailControler,
                      enabled: isLoggedIn,
                      hintText: "example@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      validator: TextFieldValidator.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    Text(S.of(context).phoneNumber,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    SettingsTextField.form(
                      controller: phoneControler,
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
