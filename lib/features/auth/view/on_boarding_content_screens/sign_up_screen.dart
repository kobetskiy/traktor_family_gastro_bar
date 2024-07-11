import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/view/auth_screens.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello,',
                    style: textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign Up!',
                    style: textTheme.titleLarge!.copyWith(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                _SignUpForm(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: textTheme.titleSmall,
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()),
                      ),
                      child: Text(
                        "Log In",
                        style: textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  child: const Text("Sign Up"),
                  onPressed: () {},
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                Text(
                  "Or sign up with",
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

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AuthTextFormField(
            controller: nameController,
            label: 'Name',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 25),
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
