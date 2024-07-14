import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/auth_social_media_button.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/auth_text_form_field.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/overlay_loader.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';

import 'reset_password_screen.dart';
import 'sign_up_screen.dart';

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
                    'Welcome back,',
                    style: textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Log In!',
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen()),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot password?',
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
                  child: const Text("Log In"),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                Text(
                  "Or log in with",
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                const _AuthSocialMediaButtonRow(),
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
          "New member?",
          style: textTheme.titleSmall,
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()),
          ),
          child: Text(
            "Sign Up",
            style: textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthSocialMediaButtonRow extends StatelessWidget {
  const _AuthSocialMediaButtonRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthSocialMediaButton(
          icon: AppIcons.google,
          onPressed: () {},
        ),
        const SizedBox(width: 25),
        AuthSocialMediaButton(
          icon: AppIcons.facebookLetter,
          onPressed: () {},
        ),
        const SizedBox(width: 25),
        AuthSocialMediaButton(
          icon: Theme.of(context).brightness == Brightness.dark
              ? AppIcons.appleLight
              : AppIcons.appleDark,
          onPressed: () {},
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
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: TextFieldValidator.validateEmail,
          ),
          const SizedBox(height: 25),
          AuthTextFormField(
            controller: widget.passwordController,
            label: 'Password',
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
