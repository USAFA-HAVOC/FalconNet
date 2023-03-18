import 'dart:math';

import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'PageWidget.dart';

class GraphWidget extends StatelessWidget {
  final String name;
  final List<FlSpot> data;
  final List<Color> gradientColors = [
    Colors.blue,
    Colors.black,
  ];

  GraphWidget({super.key, required this.name, required List<FlSpot> this.data});

  List<double> bounds() {
    if (data.isEmpty) {
      return [0, 100];
    }
    var minim = data.map((s) => s.y).reduce((carry, element) => carry < element ? carry : element);
    var maxim = data.map((s) => s.y).reduce((carry, element) => carry > element ? carry : element);
    return <double>[(minim + maxim - 100).toDouble().clamp(0, max(0, minim - 5)).toDouble(), (100).toDouble()];
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        title: name,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
                LineChartData(
                  minX: 1,
                  maxX: 7,
                  maxY: bounds().last,
                  minY: bounds().first,
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: gradientColors,
                      ),
                      spots: data.sortedKey((p) => p.x),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors
                              .map((color) => color.withOpacity(0.5))
                              .toList(),
                        ),
                      ),
                    ),

                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                )
            ),
          )
        ]
    );
  }
}