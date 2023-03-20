import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/pie_chart.dart';

void main() => runApp(const App());

/// The main app widget.
class App extends StatelessWidget {
  /// Creates a new [App] widget.
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const Center(
          child: PieChart(
            data: <double>[20, 15, 10, 8, 7, 6, 5, 4, 3, 2],
            colors: <Color>[
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.orange,
              Colors.purple,
              Colors.yellow,
              Colors.teal,
              Colors.brown,
              Colors.pink,
              Colors.grey,
            ],
            labels: <String>[
              'Red',
              'Green',
              'Blue',
              'Orange',
              'Purple',
              'Yellow',
              'Teal',
              'Brown',
              'Pink',
              'Grey',
            ],
          ),
        ),
      );
}
