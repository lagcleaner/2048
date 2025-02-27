import 'package:flutter/material.dart';
import 'package:game2048/presentation/screens/board/board_screen.dart';
import 'package:game2048/presentation/screens/home/home_screen.dart';
import 'package:game2048/presentation/screens/not_found/models/not_found_arguments_model.dart';
import 'package:game2048/presentation/screens/not_found/not_found_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(title: '2048'),
      initialRoute: BoardScreen.route,
      onUnknownRoute:
          (settings) => MaterialPageRoute(
            builder:
                (context) => NotFoundScreen(
                  arguments: NotFoundArgumentsModel(
                    routeNotFound: settings.name ?? '',
                    arguments: null,
                  ),
                ),
          ),
    );
  }
}
