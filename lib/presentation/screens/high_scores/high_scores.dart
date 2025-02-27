import 'package:flutter/material.dart';

class HighScoresScreen extends StatelessWidget {
  const HighScoresScreen({super.key, required this.title});

  static String route = "/high_scores";
  final String title;

  @override
  Widget build(BuildContext context) {
    return _HighScoresScreenInternal();
  }
}

class _HighScoresScreenInternal extends StatelessWidget {
  const _HighScoresScreenInternal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('High Scores'));
  }
}
