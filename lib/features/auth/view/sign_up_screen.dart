import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/router/router.dart';
import 'package:traktor_family_gastro_bar/core/ui/icons_constants.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/auth/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
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
      await stopLoading();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    S.of(context).hello,
                    style: textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    S.of(context).signUp_authScreen,
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
                  child: Text(S.of(context).signUp),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                Text(
                  S.of(context).orSignUpWith,
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

class _SwitchToLogIn extends StatelessWidget {
  const _SwitchToLogIn();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAnAccount,
          style: textTheme.titleSmall,
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => context.router.replace(const LogInRoute()),
          child: Text(
            S.of(context).logIn_authScreen,
            style: textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
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
            label: S.of(context).name,
            keyboardType: TextInputType.name,
            validator: TextFieldValidator.validateName,
          ),
          const SizedBox(height: 20),
          AuthTextFormField(
            controller: widget.emailController,
            label: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            validator: TextFieldValidator.validateEmail,
          ),
          const SizedBox(height: 20),
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
