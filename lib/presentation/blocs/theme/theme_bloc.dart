import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState()) {
    on<InitializedThemeEvent>(_onInitializeThemeEvent);
    on<ChangeThemeEvent>(_onChageThemeEvent);
    // Load from SharedPreferences
  }

  FutureOr<void> _onInitializeThemeEvent(
      InitializedThemeEvent event, Emitter<ThemeState> emit) async {
    SharedPreferences.getInstance().then((prefs) {
      final lightTheme = prefs.getBool('lightTheme') ?? true;
      emit(ThemeLoadedState(
          themeStateData: ThemeStateData(lightTheme: lightTheme)));
    });
  }

  FutureOr<void> _onChageThemeEvent(
      ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoadedState(
        themeStateData: ThemeStateData(lightTheme: event.value)));
    print(event.value);

    // Save to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lightTheme', event.value);
  }
}
