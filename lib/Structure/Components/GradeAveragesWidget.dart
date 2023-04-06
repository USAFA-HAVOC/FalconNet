import 'package:flutter/material.dart';

import '../../Model/Database/UnitGrades.dart';
import 'PageWidget.dart';

class GradeAveragesWidget extends StatelessWidget {
  final UnitGrades unit;
  final void Function()? onTap;
  final String label;

  const GradeAveragesWidget({super.key, required this.unit, this.onTap, this.label = "Averages"});

  double calculateAverage({required String type}) {
    List<int> array = <int>[];
    for (var grade in unit.grades.values) {
      if (type == "ami") {
        array.addAll(grade.amis.map((g) => g.score));
      }

      if (type == "pai") {
        array.addAll(grade.pais.map((g) => g.score));
      }

      if (type == "sami") {
        array.addAll(grade.samis.map((g) => g.score));
      }
    }

    if (array.isEmpty) {
      return 0;
    }

    return array.reduce((value, element) => value + element) / array.length;
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
        title: label,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        calculateAverage(type: "ami").toStringAsFixed(1),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),

                      Text(
                        "AMI Average",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                ),

                const VerticalDivider(thickness: 1,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        calculateAverage(type: "sami").toStringAsFixed(1),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),

                      Text(
                        "SAMI Average",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          if (onTap != null) ElevatedButton(onPressed: onTap, child: const Text("Open Analytics"))
        ]
    );
  }
}