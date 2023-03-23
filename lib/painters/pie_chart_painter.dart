import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';
import 'package:flutter_chart_collection/painters/base_chart_painter.dart';

/// A custom painter for drawing a donut chart.
class PieChartPainter extends BaseChartPanePainter {
  /// Initializes a new [PieChartPainter].
  PieChartPainter(
    List<BaseChartModel> data, {
    this.selectedSegment,
    this.width = 0.2,
    this.isDonutChart = true,
  }) : super(data);

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

  /// The index of the selected segment.
  ///
  /// If `null`, no segment will be selected.
  final int? selectedSegment;

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

      final double segmentRadius = i == selectedSegment ? radius * 1.2 : radius;

      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(centerX, centerY),
          radius: segmentRadius,
        ),
        currentAngle,
        angles[i],
        false,
        arcPaint,
      );

      final double angleMiddle = currentAngle + (angles[i] / 2);
      final double x = centerX + (segmentRadius * cos(angleMiddle));
      final double y = centerY + (segmentRadius * sin(angleMiddle));

      final TextSpan span = TextSpan(
        text: '${data[i].value}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );

      final TextPainter textPainter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter
        ..layout()
        ..paint(
          canvas,
          Offset(x - (textPainter.width / 2), y - (textPainter.height / 2)),
        );

      currentAngle += angles[i];
    }
  }
}
