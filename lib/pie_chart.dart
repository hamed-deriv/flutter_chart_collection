import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Pie chart widget.
class PieChart extends StatefulWidget {
  /// Initializes a new instance of the [PieChart] class.
  const PieChart({
    required this.data,
    required this.colors,
    required this.labels,
  });

  /// The data to be displayed in the pie chart.
  final List<double> data;

  /// The colors to be used for each data item.
  final List<Color> colors;

  /// The labels to be used for each data item.
  final List<String> labels;

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  int? _selectedIndex;
  double angle = 0;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: SizedBox(
          width: 400,
          height: 400,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      angle -= details.delta.dx * 0.01;
                      angle += details.delta.dy * 0.01;
                    });
                  },
                  child: Transform.rotate(
                    angle: angle,
                    child: CustomPaint(
                      painter: PieChartPainter(
                        data: widget.data,
                        colors: widget.colors,
                        selectedIndex: _selectedIndex,
                        onItemSelected: (int index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(
                    widget.labels.length,
                    (int index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              color: widget.colors[index],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              ' ${widget.labels[index]} (${widget.data[index] / 1}%)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: _selectedIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

/// The custom painter for the pie chart.
class PieChartPainter extends CustomPainter {
  /// Initializes a new instance of the [PieChartPainter] class.
  PieChartPainter({
    required this.data,
    required this.colors,
    required this.onItemSelected,
    this.selectedIndex,
  });

  /// The data to be displayed in the pie chart.
  final List<double> data;

  /// The colors to be used for each data item.
  final List<Color> colors;

  /// The callback function to be called when a legend item is tapped.
  final Function(int) onItemSelected;

  /// The index of the selected item.
  final int? selectedIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final double total =
        data.reduce((double value, double element) => value + element);
    double startAngle = -math.pi / 2;
    double endAngle = 0;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.clipRect(rect);

    for (int i = 0; i < data.length; i++) {
      final Paint paint = Paint()
        ..color = colors[i].withOpacity(selectedIndex == i ? 0.5 : 1);

      endAngle = startAngle + (data[i] / total) * 2 * math.pi;
      canvas.drawArc(rect, startAngle, endAngle - startAngle, true, paint);
      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) => true;
}
