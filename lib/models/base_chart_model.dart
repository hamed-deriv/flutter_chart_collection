import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Base chart model for passing data to the charts.
class BaseChartModel with EquatableMixin {
  /// Initializes a new [BaseChartModel].
  BaseChartModel({
    required this.value,
    required this.color,
    required this.label,
  });

  /// The label of the chart data.
  final String label;

  /// The color of the chart data.
  final Color color;

  /// The value of the chart data.
  final double value;

  @override
  List<Object?> get props => <Object?>[value, color, label];
}
