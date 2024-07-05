import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/services/theme_service.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    final themeService = ThemeService();
    on<LoadTheme>((event, emit) async {
      final themeName = await themeService.getTheme();
      emit(ThemeState(themeName));
    });

    on<ChangeTheme>((event, emit) async {
      if (event.themeMode == state.themeMode) return;
      await themeService.saveTheme(event.themeMode);
      emit(ThemeState(event.themeMode));
    });
  }
}
