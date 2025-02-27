import 'dart:ui';

class ThemeConstants {
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultElevation = 4.0;
  static const double defaultIconSize = 24.0;
  static const double defaultIconButtonSize = 48.0;
  static const double defaultTextSize = 16.0;
  static const double defaultButtonHeight = 48.0;
  // Tile Colors
  static const Color lightBrown = Color.fromARGB(255, 205, 193, 180);
  static const Color darkBrown = Color.fromARGB(255, 187, 173, 160);
  static const Color tan = Color.fromARGB(255, 238, 228, 218);
  static const Color greyText = Color.fromARGB(255, 119, 110, 101);
  static const Map<int, Color> numTileColor = {
    2: tan,
    4: Color.fromARGB(255, 225, 215, 205),
    8: Color.fromARGB(255, 242, 177, 121),
    16: Color.fromARGB(255, 245, 149, 99),
    32: Color.fromARGB(255, 246, 124, 95),
    64: Color.fromARGB(255, 246, 95, 64),
    128: Color.fromARGB(255, 235, 208, 117),
    256: Color.fromARGB(255, 237, 203, 103),
    512: Color.fromARGB(255, 236, 201, 85),
    1024: Color.fromARGB(255, 229, 194, 90),
    2048: Color.fromARGB(255, 232, 192, 70),
  };
}
