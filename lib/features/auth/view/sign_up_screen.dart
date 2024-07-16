import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/auth/view/auth_screens.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with OverlayLoader {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      await AuthService.signUp(
        context: context,
        name: nameController.text.trim(),
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
                  formKey: formKey,
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 30),
                const _SwitchToLogIn(),
                const SizedBox(height: 30),
                PrimaryButton(
                  onPressed: signUp,
                  child: const Text("Sign Up"),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
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

class _SwitchToLogIn extends StatelessWidget {
  const _SwitchToLogIn();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
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
            MaterialPageRoute(builder: (context) => const LogInScreen()),
          ),
          child: Text(
            "Log In",
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
          onPressed: () => AuthService.signInWithGoogle(context),
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

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AuthTextFormField(
            controller: widget.nameController,
            label: 'Name',
            keyboardType: TextInputType.name,
            validator: TextFieldValidator.validateName,
          ),
          const SizedBox(height: 20),
          AuthTextFormField(
            controller: widget.emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: TextFieldValidator.validateEmail,
          ),
          const SizedBox(height: 20),
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
