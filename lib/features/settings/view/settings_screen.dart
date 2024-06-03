import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/ui_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/widgets.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).settings),
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).general,
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  const SettingsMainSection(),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).more,
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  const SettingsMoreSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
