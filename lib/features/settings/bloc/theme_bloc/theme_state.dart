part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);

  factory ThemeState.initial() {
    return const ThemeState(ThemeMode.dark);
  }

  ThemeState copyWith(Locale locale) {
    return ThemeState(themeMode);
  }

  @override
  List<Object> get props => [themeMode];
}
