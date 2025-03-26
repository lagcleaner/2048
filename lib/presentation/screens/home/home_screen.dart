// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.args});

  static const String route = "/home";
  final Object? args;

  @override
  Widget build(BuildContext context) {
    return _HomeScreenInternal();
  }
}

class _HomeScreenInternal extends StatelessWidget {
  const _HomeScreenInternal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('2048'),
      ),
      body: Center(
        child: Column(
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text('something')],
        ),
      ),
    );
  }
}
