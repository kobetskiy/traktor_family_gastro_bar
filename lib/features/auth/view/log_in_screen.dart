import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/overlay_loader.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with OverlayLoader {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> logIn() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      await AuthService.logIn(
        context: context,
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      stopLoading();
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    S.of(context).welcomeBack,
                    style: textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    S.of(context).logIn_authScreen,
                    style: textTheme.titleLarge!.copyWith(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
                _LogInForm(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => context.router.push(const ResetPasswordRoute()),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      S.of(context).forgotPassword,
                      style: textTheme.titleSmall!.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.046),
                const _SwitchToSignUp(),
                const SizedBox(height: 30),
                PrimaryButton(
                  onPressed: logIn,
                  child: Text(S.of(context).logIn),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                Text(
                  S.of(context).orLogInWith,
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                const AuthSocialMediaButtonRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SwitchToSignUp extends StatelessWidget {
  const _SwitchToSignUp();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).newMember,
          style: textTheme.titleSmall,
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => context.router.replace(const SignUpRoute()),
          child: Text(
            S.of(context).signUp_authScreen,
            style: textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _LogInForm extends StatefulWidget {
  const _LogInForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<_LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<_LogInForm> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AuthTextFormField(
            controller: widget.emailController,
            label: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            validator: TextFieldValidator.validateEmail,
          ),
          const SizedBox(height: 25),
          AuthTextFormField(
            controller: widget.passwordController,
            label: S.of(context).password,
            keyboardType: TextInputType.visiblePassword,
            validator: TextFieldValidator.validatePassword,
            isObscureText: isObscured,
            suffixIcon: IconButton(
              icon: Image.asset(
                isObscured ? AppIcons.eyeClosed : AppIcons.eyeOpen,
                color: Colors.grey[600],
                width: 25,
              ),
              onPressed: () {
                isObscured = !isObscured;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
