import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = FlexColorScheme.light(
    scaffoldBackground: const Color(0xffEEEEEE),
    colors: FlexSchemeColor.from(
      primary: Colors.redAccent[700]!,
      secondary: const Color(0xff4d4d4d),
      tertiary: Colors.white,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  ).toTheme;

  static ThemeData darkTheme = FlexColorScheme.dark(
    colors: FlexSchemeColor.from(
      primary: Colors.redAccent[700]!,
      secondary: const Color(0xff4d4d4d),
      tertiary: Colors.white,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  ).toTheme;

  static ThemeData getAppTheme(bool isLightTheme) {
    return isLightTheme ? lightTheme : darkTheme;
  }
}

Color primaryColor(BuildContext context) =>
    Theme.of(context).colorScheme.primary;
Color secondaryColor(BuildContext context) =>
    Theme.of(context).colorScheme.secondary;
Color tertiaryColor(BuildContext context) =>
    Theme.of(context).colorScheme.tertiary;
