import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/auth/services/auth_service.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with OverlayLoader {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      await AuthService.resetPassword(context, emailController.text.trim());
      stopLoading();
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
            AppBarWidget(title: S.of(context).resetPassword),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Text(
                  "Введіть свою пошту",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "На пошту буде відправлено посилання на оновлення паролю",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                Form(
                  key: formKey,
                  child: TextFormField(
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        color: Colors.grey[600],
                        onPressed: () => emailController.clear,
                      ),
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: TextFieldValidator.validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryButton(
          onPressed: resetPassword,
          child: Text(S.of(context).resetPassword),
        ),
      ),
    );
  }
}
