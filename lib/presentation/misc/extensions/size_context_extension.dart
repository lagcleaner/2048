import 'dart:math' show max, min;

import 'package:flutter/material.dart';

extension BoardSizeExtension on BuildContext {
  double get boardSize => max(
    300.0,
    min((MediaQuery.of(this).size.shortestSide * 0.90).floorToDouble(), 430.0),
  );
}
