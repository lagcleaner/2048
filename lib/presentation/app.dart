import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/controllers/theme_cubit.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';
import 'package:game2048/presentation/screens/board/board_screen.dart';
import 'package:game2048/presentation/screens/high_scores/high_scores.dart';
import 'package:game2048/presentation/screens/home/home_screen.dart';
import 'package:game2048/presentation/screens/not_found/models/not_found_arguments_model.dart';
import 'package:game2048/presentation/screens/not_found/not_found_screen.dart';

class TwentyFortyEightApp extends ConsumerWidget {
  const TwentyFortyEightApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: '2048',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeProvider),
      theme: ThemeConstants.lightTheme,
      darkTheme: ThemeConstants.darkTheme,
      initialRoute: BoardScreen.route,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case BoardScreen.route:
            return CupertinoPageRoute(
              builder: (context) => BoardScreen(args: settings.arguments),
            );
          case HomeScreen.route:
            return CupertinoPageRoute(
              builder: (context) => HomeScreen(args: settings.arguments),
            );
          case HighScoresScreen.route:
            return CupertinoPageRoute(
              builder: (context) => HighScoresScreen(args: settings.arguments),
            );
          case '' || null:
          default:
            return CupertinoPageRoute(
              builder:
                  (context) => NotFoundScreen(
                    arguments: NotFoundArgumentsModel(
                      routeNotFound: settings.name ?? '',
                      arguments: settings.arguments,
                    ),
                  ),
            );
        }
      },
    );
  }
}
