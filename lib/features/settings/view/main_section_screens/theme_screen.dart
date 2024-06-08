import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

enum ThemeValues { dark, light, auto }

class _ThemeScreenState extends State<ThemeScreen> {
  ThemeValues? _currentValue = ThemeValues.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).theme),
          ],
          body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              RadioListTile<ThemeValues>(
                title: Text('Темна', style: AppTextStyles.titleSmall),
                value: ThemeValues.dark,
                groupValue: _currentValue,
                onChanged: (ThemeValues? value) {
                  _currentValue = value;
                  setState(() {});
                },
              ),
              RadioListTile<ThemeValues>(
                title: Text('Світла', style: AppTextStyles.titleSmall),
                value: ThemeValues.light,
                groupValue: _currentValue,
                onChanged: (ThemeValues? value) {
                  _currentValue = value;
                  setState(() {});
                },
              ),
              RadioListTile<ThemeValues>(
                title: Text('Авто.', style: AppTextStyles.titleSmall),
                value: ThemeValues.auto,
                groupValue: _currentValue,
                onChanged: (ThemeValues? value) {
                  _currentValue = value;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
