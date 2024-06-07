import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).notifications),
          ],
          body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SwitchListTile.adaptive(
                title: Text(
                  "Сповіщення на телефон",
                  style: AppTextStyles.titleSmall,
                ),
                subtitle: Text(
                  "Оберіть чи хочете ви отримувати сповіщення на телефон",
                  style: AppTextStyles.subtitle
                      .copyWith(color: AppColors.subtitleColor),
                ),
                value: false,
                onChanged: null,
              ),
              SwitchListTile.adaptive(
                title: Text(
                  "Сповіщення на email",
                  style: AppTextStyles.titleSmall,
                ),
                subtitle: Text(
                  "Оберіть чи хочете ви отримувати сповіщення на email",
                  style: AppTextStyles.subtitle
                      .copyWith(color: AppColors.subtitleColor),
                ),
                value: false,
                onChanged: null,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Ви не авторизовані, тому не вам не можуть приходити сповіщення на телефон та email",
                      style: TextStyle(color: Colors.red[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Авторизуватись",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SwitchListTile.adaptive(
                title: Text(
                  "Нові страви",
                  style: AppTextStyles.titleSmall,
                ),
                subtitle: Text(
                  "Ви будете сповіщені, коли у меню додадуть нову страву",
                  style: AppTextStyles.subtitle
                      .copyWith(color: AppColors.subtitleColor),
                ),
                value: true,
                onChanged: (bool value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
