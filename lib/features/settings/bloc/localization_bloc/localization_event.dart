part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocalization extends LocalizationEvent {
  final Locale locale;
  const ChangeLocalization(this.locale);

  @override
  List<Object> get props => [locale];
}

class LoadLocalization extends LocalizationEvent {}
