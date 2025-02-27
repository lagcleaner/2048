import 'package:flutter/material.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    surface: ThemeConstants.lightBrown,
    primary: ThemeConstants.tan,
    secondary: ThemeConstants.darkBrown,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    surface: const Color.fromARGB(255, 49, 27, 3),
    primary: const Color.fromARGB(255, 21, 11, 2),
    secondary: const Color.fromARGB(255, 80, 44, 9),
  
  ),

);
