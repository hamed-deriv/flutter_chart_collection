import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';
import 'package:flutter_chart_collection/painters/pie_chart_painter.dart';
import 'package:flutter_chart_collection/widgets/legend.dart';
import 'package:flutter_chart_collection/widgets/rotate.dart';

void main() => runApp(App());

/// The main app widget.
class App extends StatelessWidget {
  /// Creates a new [App] widget.
  App({Key? key}) : super(key: key);

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
                    child: CustomPaint(painter: PieChartPainter(_data)),
                  ),
                ),
                Legend(
                  data: _data,
                  onTap: (int index) => developer.log('${_data[index].label}'),
                ),
              ],
            ),
          ),
        ),
      );
}
