import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';

/// A base class for custom painters for drawing a chart.
abstract class BaseChartPanePainter extends CustomPainter {
  /// Initializes a new [BaseChartPanePainter].
  BaseChartPanePainter(this.data);

  /// The data to be drawn.
  final List<BaseChartModel> data;

  @override
  bool shouldRepaint(BaseChartPanePainter oldDelegate) =>
      oldDelegate.data != data;
}
