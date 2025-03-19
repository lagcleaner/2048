part of 'theme.dart';

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    surface: ThemeConstants.surfaceLight,
    primary: ThemeConstants.color2048,
    secondary: ThemeConstants.darkBrown,
    surfaceTint: Colors.transparent,
  ),
);
