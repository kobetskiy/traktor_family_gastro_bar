part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  const ChangeTheme({required this.themeMode});
  
  final ThemeMode themeMode;
}

class LoadTheme extends ThemeEvent {}