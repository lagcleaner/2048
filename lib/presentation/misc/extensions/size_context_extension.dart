import 'dart:math' show max, min;

import 'package:flutter/material.dart';

extension BoardSizeExtension on BuildContext {
  double get boardSize => max(
    200.0,
    min((MediaQuery.of(this).size.shortestSide * 0.85).floorToDouble(), 450.0),
  );
}
