import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';

/// A custom painter for drawing a donut chart.
class PieChartPainter extends CustomPainter {
  /// Initializes a new [PieChartPainter].
  PieChartPainter(this.data, {this.width = 0.2, this.isDonutChart = true});

  /// The data to be drawn.
  final List<BaseChartModel> data;

  /// The width of the chart.
  ///
  /// Defaults to `0.2`.
  /// The value must be between `0.0` and `0.5`.
  final double width;

  /// Whether the chart should be drawn as a donut chart.
  ///
  /// If false, the chart will be drawn as a pie chart.
  /// Defaults to `true`.
  final bool isDonutChart;

  @override
  void paint(Canvas canvas, Size size) {
    const double startAngle = -pi / 2;

    final double strokeWidth =
        min(size.width, size.height) * (isDonutChart ? width : 0.5);
    final double radius = (min(size.width, size.height) - strokeWidth) / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double total =
        data.fold(0, (double sum, BaseChartModel item) => sum + item.value);

    final List<double> angles = data
        .map((BaseChartModel item) => (item.value / total) * 2 * pi)
        .toList();

    double currentAngle = startAngle;
    for (int i = 0; i < data.length; i++) {
      final Paint arcPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = data[i].color;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        currentAngle,
        angles[i],
        false,
        arcPaint,
      );

      currentAngle += angles[i];
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) => true;
}
