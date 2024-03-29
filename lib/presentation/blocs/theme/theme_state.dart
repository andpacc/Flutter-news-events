// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeStateData {
  final bool? lightTheme;

  const ThemeStateData({
    this.lightTheme = true,
  });

  ThemeStateData copyWith({
    bool? lightTheme,
  }) {
    return ThemeStateData(
      lightTheme: lightTheme ?? this.lightTheme,
    );
  }
}

abstract class ThemeState {
  final ThemeStateData themeStateData;

  const ThemeState({required this.themeStateData});
}

class ThemeInitialState extends ThemeState {
  ThemeInitialState({super.themeStateData = const ThemeStateData()});
}

class ThemeLoadedState extends ThemeState {
  const ThemeLoadedState({required super.themeStateData});
}

class ThemeErrorState extends ThemeState {
  final String message;

  const ThemeErrorState({required super.themeStateData, required this.message});
}
