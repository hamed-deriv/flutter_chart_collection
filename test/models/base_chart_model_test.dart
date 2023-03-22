import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';

void main() {
  group('base chart model test =>', () {
    test('should correctly create a new instance.', () {
      final BaseChartModel chartData = BaseChartModel(
        value: 10,
        color: Colors.blue,
        label: 'Example',
      );

      expect(chartData.value, equals(10.0));
      expect(chartData.color, equals(Colors.blue));
      expect(chartData.label, equals('Example'));
    });

    test('should correctly implement equatable.', () {
      final BaseChartModel chartData1 = BaseChartModel(
        value: 10,
        color: Colors.blue,
        label: 'Example',
      );

      final BaseChartModel chartData2 = BaseChartModel(
        value: 10,
        color: Colors.blue,
        label: 'Example',
      );

      final BaseChartModel chartData3 = BaseChartModel(
        value: 5,
        color: Colors.red,
        label: 'Different Example',
      );

      expect(chartData1 == chartData2, isTrue);
      expect(chartData1 == chartData3, isFalse);

      expect(chartData1.props.length, equals(3));
      expect(chartData1.props, equals(chartData2.props));
    });
  });
}
