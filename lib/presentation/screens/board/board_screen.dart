// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:game2048/presentation/screens/board/models/board_arguments_model.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, required this.boardArguments});

  static String route = "/board";
  final BoardArgumentsModel boardArguments;

  @override
  Widget build(BuildContext context) {
    return _BoardScreenInternal(boardArguments: boardArguments);
  }
}

class _BoardScreenInternal extends StatefulWidget {
  const _BoardScreenInternal({Key? key, required this.boardArguments})
    : super(key: key);
  final BoardArgumentsModel boardArguments;

  @override
  State<_BoardScreenInternal> createState() => _BoardScreenInternalState();
}

class _BoardScreenInternalState extends State<_BoardScreenInternal> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('2048'),
      ),
      body: Center(
        child: Column(
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
