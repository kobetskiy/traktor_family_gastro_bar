import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/auth_social_media_button.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/auth_text_form_field.dart';
import 'package:traktor_family_gastro_bar/features/widgets/primary_button.dart';

import 'sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

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
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: textTheme.titleSmall!.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.059),
                Row(
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
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      ),
                      child: Text(
                        "Sign Up",
                        style: textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  child: const Text("Log In"),
                  onPressed: () {},
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
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

class _LogInForm extends StatelessWidget {
  const _LogInForm({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AuthTextFormField(
            controller: emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 25),
          AuthTextFormField(
            controller: passwordController,
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
