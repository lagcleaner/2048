// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class GameMovementDetector extends StatelessWidget {
  const GameMovementDetector({
    Key? key,
    required this.child,
    this.onSwipeUp,
    this.onSwipeDown,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onKeyPressed,
  }) : super(key: key);

  final Widget child;
  final Future<void> Function()? onSwipeUp;
  final Future<void> Function()? onSwipeDown;
  final Future<void> Function()? onSwipeLeft;
  final Future<void> Function()? onSwipeRight;
  final Future<void> Function(LogicalKeyboardKey key)? onKeyPressed;
  static const _minimumOffset = 100.0;

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is! KeyDownEvent) return;
        switch (event.logicalKey) {
          case LogicalKeyboardKey.arrowUp:
            onSwipeUp?.call();
            break;
          case LogicalKeyboardKey.arrowDown:
            onSwipeDown?.call();
            break;
          case LogicalKeyboardKey.arrowLeft:
            onSwipeLeft?.call();
            break;
          case LogicalKeyboardKey.arrowRight:
            onSwipeRight?.call();
            break;
          default:
            onKeyPressed?.call(event.logicalKey);
            break;
        }
      },
      child: SwipeDetector(
        onSwipe: (direction, offset) {
          if (offset.dx.abs() < _minimumOffset &&
              offset.dy.abs() < _minimumOffset) {
            return;
          }
          switch (direction) {
            case SwipeDirection.up:
              onSwipeUp?.call();
              break;
            case SwipeDirection.down:
              onSwipeDown?.call();
              break;
            case SwipeDirection.left:
              onSwipeLeft?.call();
              break;
            case SwipeDirection.right:
              onSwipeRight?.call();
              break;
          }
        },
        child: child,
      ),
    );
  }
}
