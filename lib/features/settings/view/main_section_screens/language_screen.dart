import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/settings/bloc/localization_bloc/localization_bloc.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/models/language_model.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    String groupValue =
        context.read<LocalizationBloc>().state.locale.languageCode;
    return BlocConsumer<LocalizationBloc, LocalizationState>(
      listener: (context, state) {
        groupValue = state.locale.languageCode;
      },
      builder: (context, state) {
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: languageModel.length,
                      itemBuilder: (context, index) {
                        final item = languageModel[index];
                        return RadioListTile(
                          title: Text(item.language,
                              style: Theme.of(context).textTheme.titleSmall),
                          value: item.languageCode,
                          groupValue: groupValue,
                          onChanged: (String? value) {
                            BlocProvider.of<LocalizationBloc>(context).add(
                              ChangeLocalization(Locale(item.languageCode)),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
