import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:traktor_family_gastro_bar/features/settings/data/services/localization_service.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initial()) {
    final localizationService = LocalizationService();
    on<LoadLocalization>((event, emit) async {
      Locale saveLocale = await localizationService.getLocale();
      emit(LocalizationState(saveLocale));
    });

    on<ChangeLocalization>((event, emit) async {
      if (event.locale == state.locale) return;
      await localizationService.saveLocale(event.locale);
      emit(LocalizationState(event.locale));
    });
  }
}
