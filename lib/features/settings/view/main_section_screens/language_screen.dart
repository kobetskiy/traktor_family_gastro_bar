import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

enum LanguageValues { en, uk, auto }

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageValues? _currentValue = LanguageValues.uk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).language),
          ],
          body: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              RadioListTile<LanguageValues>(
                title: Text('Українська', style: AppTextStyles.titleSmall),
                value: LanguageValues.uk,
                groupValue: _currentValue,
                onChanged: (LanguageValues? value) {
                  _currentValue = value;
                  setState(() {});
                },
              ),
              RadioListTile<LanguageValues>(
                title: Text('English', style: AppTextStyles.titleSmall),
                value: LanguageValues.en,
                groupValue: _currentValue,
                onChanged: (LanguageValues? value) {
                  _currentValue = value;
                  setState(() {});
                },
              ),
              RadioListTile<LanguageValues>(
                title: Text('Авто.', style: AppTextStyles.titleSmall),
                value: LanguageValues.auto,
                groupValue: _currentValue,
                onChanged: (LanguageValues? value) {
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
