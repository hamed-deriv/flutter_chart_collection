import 'package:flutter/material.dart';

import 'package:flutter_chart_collection/models/base_chart_model.dart';

/// A widget for displaying a legend for a chart.
class Legend extends StatelessWidget {
  /// Initializes a new [Legend].
  const Legend({
    required this.data,
    this.onTap,
    Key? key,
  }) : super(key: key);

  /// The data to be displayed in the legend.
  final List<BaseChartModel> data;

  /// The callback to be called when a legend item is tapped.
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data
            .map(
              (BaseChartModel item) => InkWell(
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: item.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.label,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                onTap: () => onTap?.call(data.indexOf(item)),
              ),
            )
            .toList(),
      );
}
