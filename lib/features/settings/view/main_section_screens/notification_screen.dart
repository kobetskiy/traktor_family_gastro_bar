// ignore_for_file: unused_element

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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              _SwitchTileWidget(
                title: S.of(context).emailNotification,
                value: false,
                onChanged: null,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      S.of(context).youAreNotAuthorizedNotifications,
                      style: TextStyle(color: Colors.red[400]),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(S.of(context).logIn),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _SwitchTileWidget(
                title: S.of(context).deliveryNotification,
                value: true,
                onChanged: (bool value) {},
              ),
              const SizedBox(height: 10),
              _SwitchTileWidget(
                title: S.of(context).reservationNotification,
                value: true,
                onChanged: (bool value) {},
              ),
              const SizedBox(height: 10),
              _SwitchTileWidget(
                title: S.of(context).newDishesNotification,
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

class _SwitchTileWidget extends StatelessWidget {
  const _SwitchTileWidget({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(title, style: AppTextStyles.titleSmall),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.subtitleColor,
              ),
            )
          : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
