import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traktor_family_gastro_bar/features/settings/bloc/theme_bloc/theme_bloc.dart';
import 'package:traktor_family_gastro_bar/features/widgets/app_bar_widget.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

@RoutePage()
class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {

  ThemeMode? currentValue = BlocProvider.of<ThemeBloc>(context).state.themeMode;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(title: S.of(context).theme),
          ],
          body: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              RadioListTile<ThemeMode>(
                title: Text(S.of(context).dark,
                    style: Theme.of(context).textTheme.titleSmall),
                value: ThemeMode.dark,
                groupValue: currentValue,
                onChanged: (ThemeMode? value) {
                  currentValue = value;
                  setState(() {});
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ChangeTheme(themeMode: ThemeMode.dark));
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(S.of(context).light,
                    style: Theme.of(context).textTheme.titleSmall),
                value: ThemeMode.light,
                groupValue: currentValue,
                onChanged: (ThemeMode? value) {
                  currentValue = value;
                  setState(() {});
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ChangeTheme(themeMode: ThemeMode.light));
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(S.of(context).auto,
                    style: Theme.of(context).textTheme.titleSmall),
                value: ThemeMode.system,
                groupValue: currentValue,
                onChanged: (ThemeMode? value) {
                  currentValue = value;
                  setState(() {});
                  BlocProvider.of<ThemeBloc>(context)
                      .add(const ChangeTheme(themeMode: ThemeMode.system));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
