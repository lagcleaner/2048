import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/controllers/theme_cubit.dart';

class ThemeToggleButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.read(themeProvider);

    return IconButton(
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder:
            (child, animation) =>
                ScaleTransition(scale: animation, child: child),
        child:
            mode == ThemeMode.dark
                ? Icon(
                  Icons.dark_mode,
                  key: ValueKey('dark'),
                  color: Colors.grey,
                )
                : Icon(
                  Icons.light_mode,
                  key: ValueKey('light'),
                  color: Colors.orange,
                ),
      ),
      onPressed: () => ref.read(themeProvider.bloc).toggle(),
    );
  }
}
