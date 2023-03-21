import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';
import 'package:flutter_chart_collection/painters/pie_chart_painter.dart';
import 'package:flutter_chart_collection/widgets/legend.dart';
import 'package:flutter_chart_collection/widgets/rotate.dart';

void main() => runApp(const App());

/// The main app widget.
class App extends StatefulWidget {
  /// Creates a new [App] widget.
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<BaseChartModel> _data = <BaseChartModel>[
    BaseChartModel(
      value: 10,
      color: Colors.red,
      label: 'Red',
    ),
    BaseChartModel(
      value: 20,
      color: Colors.green,
      label: 'Green',
    ),
    BaseChartModel(
      value: 30,
      color: Colors.blue,
      label: 'Blue',
    ),
    BaseChartModel(
      value: 40,
      color: Colors.yellow,
      label: 'Yellow',
    ),
  ];

  int? _selectedSegment = 0;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Rotate(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: CustomPaint(
                      painter: PieChartPainter(
                        _data,
                        selectedSegment: _selectedSegment,
                      ),
                    ),
                  ),
                ),
                Legend(
                  data: _data,
                  onTap: (int index) => setState(
                    () => _selectedSegment = index,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
