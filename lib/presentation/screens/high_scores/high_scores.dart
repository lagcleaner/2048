import 'package:flutter/material.dart';

class HighScoresScreen extends StatelessWidget {
  const HighScoresScreen({super.key, this.args});

  static const String route = "/high_scores";
  final Object? args;

  @override
  Widget build(BuildContext context) {
    var _ = switch (args) {
      Map<String, dynamic> args => args,
      Object _ => throw UnimplementedError(),
      null => throw UnimplementedError(),
    };
    return _HighScoresScreenInternal();
  }
}

class _HighScoresScreenInternal extends StatelessWidget {
  const _HighScoresScreenInternal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('High Scores'));
  }
}
