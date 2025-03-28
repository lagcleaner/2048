import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/components/gaps.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';

class ButtonWidget extends ConsumerWidget {
  const ButtonWidget({Key? key, this.text, this.icon, required this.onPressed})
    : super(key: key);

  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (icon != null) {
      //Button Widget with icon for Undo and Restart Game button.
      return Container(
        decoration: BoxDecoration(
          color: ThemeConstants.darkBrown,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: IconButton(
          color: ThemeConstants.textColorWhite,
          onPressed: onPressed,
          icon: Icon(icon, size: Sizes.p24),
        ),
      );
    }
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(16.0),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }
}
