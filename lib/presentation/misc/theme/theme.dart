import 'package:flutter/material.dart';

part 'dark_mode.dart';
part 'light_mode.dart';

class ThemeConstants {
  static const defaultPadding = 16.0;
  static const defaultRadius = 12.0;
  static const defaultElevation = 4.0;
  static const defaultIconSize = 24.0;
  static const defaultIconButtonSize = 48.0;
  static const defaultTextSize = 16.0;
  static const defaultButtonHeight = 48.0;
  // Tile Colors
  static const surfaceLight = Color.fromARGB(255, 250, 248, 239);
  static const lightBrown = Color.fromARGB(255, 205, 193, 180);
  static const darkBrown = Color.fromARGB(255, 187, 173, 160);
  static const tan = Color.fromARGB(255, 238, 228, 218);
  static const greyText = Color.fromARGB(255, 119, 110, 101);
  static const whiteText = Color.fromARGB(255, 249, 246, 242);
  static const overlayColor = Color.fromRGBO(238, 228, 218, 0.73);
  static const buttonColor = Color.fromARGB(255, 143, 122, 102);

  static const color2 = Color.fromARGB(255, 238, 228, 218);
  static const color4 = Color.fromARGB(255, 238, 225, 201);
  static const color8 = Color.fromARGB(255, 243, 178, 122);
  static const color16 = Color.fromARGB(255, 246, 150, 100);
  static const color32 = Color.fromARGB(255, 247, 124, 95);
  static const color64 = Color.fromARGB(255, 247, 95, 59);
  static const color128 = Color.fromARGB(255, 237, 208, 115);
  static const color256 = Color.fromARGB(255, 237, 204, 98);
  static const color512 = Color.fromARGB(255, 237, 201, 80);
  static const color1024 = Color.fromARGB(255, 237, 197, 63);
  static const color2048 = Color.fromARGB(255, 237, 194, 46);

  static const Map<int, Color> numTileColor = {
    2: color2,
    4: color4,
    8: color8,
    16: color16,
    32: color32,
    64: color64,
    128: color128,
    256: color256,
    512: color512,
    1024: color1024,
    2048: color2048,
  };

  // Themes
  static final ThemeData lightTheme = lightThemeData;
  static final ThemeData darkTheme = darkThemeData;
}
