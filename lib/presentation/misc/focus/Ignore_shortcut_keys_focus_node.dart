import 'package:flutter/material.dart';

class IgnoreShortcutKeysFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
