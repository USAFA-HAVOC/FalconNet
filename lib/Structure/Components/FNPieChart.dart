import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Indicator.dart';

class FNPieChartData {
  final String label;
  final double value;
  final Color color;
  final bool primary;

  const FNPieChartData({required this.label, required this.value, required this.primary, required this.color});
}

class FNPieChart extends StatefulWidget {
  final List<FNPieChartData> values;

  const FNPieChart({super.key, required this.values});

  @override
  State<StatefulWidget> createState() => FNPieChartState();
}

class FNPieChartState extends State<FNPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];
    int index = 0;
    for (var value in widget.values) {
      indicators.addAll([
        Indicator(
          color: widget.values[index].color,
          text: value.label,
          isSquare: true
        ),

        const SizedBox(
          height: 4,
        )
      ]);
      index++;
    }

    double total = widget.values.map((s) => s.value).reduce((carry, s) => carry + s);
    double primary = widget.values.where((section) => section.primary).map((s) => s.value).reduce((carry, s) => carry + s);

    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(total),
                  ),
                ),

                Text(
                  "${(100 * primary / total).toStringAsFixed(0)}%",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          ),
        ),

        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: indicators
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(double total) {
    return List.generate(widget.values.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 15.0;
      final radius = isTouched ? 40.0 : 30.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: widget.values[i].color,
        value: widget.values[i].value,
        title: widget.values[i].value.toStringAsFixed(0),
        radius: radius,
        showTitle: widget.values[i].value != total,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }
}