part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class InitializedThemeEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final bool value;

  ChangeThemeEvent(this.value);
}
