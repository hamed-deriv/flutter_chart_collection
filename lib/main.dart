import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';
import 'package:flutter_chart_collection/painters/pie_chart_painter.dart';
import 'package:flutter_chart_collection/widgets/legend.dart';

void main() => runApp(const App());

/// The main app widget.
class App extends StatelessWidget {
  /// Creates a new [App] widget.
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BaseChartModel> data = <BaseChartModel>[
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

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: CustomPaint(painter: PieChartPainter(data)),
              ),
              Legend(
                data: data,
                onTap: (int index) => developer.log('${data[index].label}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
