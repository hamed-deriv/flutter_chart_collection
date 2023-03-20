import 'package:flutter/material.dart';

void main() => runApp(const App());

/// The main app widget.
class App extends StatelessWidget {
  /// Creates a new [App] widget.
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const Center(child: Text('Hello World!')),
      );
}
