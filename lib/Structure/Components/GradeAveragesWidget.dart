import 'package:flutter/material.dart';

import '../../Model/Database/UnitGrades.dart';
import '../../Model/Database/UserGrades.dart';
import 'GradeBoard.dart';
import 'PageWidget.dart';

class GradeAveragesWidget extends StatelessWidget {
  final String ami;
  final String sami;
  final void Function()? onTap;
  final String label;

  GradeAveragesWidget.unit({super.key, required UnitGrades unit, this.onTap, this.label = "Averages"}) :
        ami = !unit.grades.values.any((grade) => grade.amis.isNotEmpty)
            ? "NA"
            : GradeBoard.fromUnitGrades(unit: unit)
                .average("ami")
                .toStringAsFixed(0),
        sami = !unit.grades.values.any((grade) => grade.samis.isNotEmpty)
            ? "NA"
            : GradeBoard.fromUnitGrades(unit: unit)
                .average("sami")
                .toStringAsFixed(0);

  GradeAveragesWidget.user({super.key, required UserGrades user, this.onTap, this.label = "Averages"}) :
        ami = user.amis.isEmpty
            ? "NA"
            : (user.amis.map((g) => g.score)
                .reduce((carry, value) => carry + value) / user.amis.length)
                .toStringAsFixed(1),
        sami = user.samis.isEmpty
            ? "NA"
            : (user.samis.map((g) => g.score)
                .reduce((carry, value) => carry + value) / user.samis.length)
                .toStringAsFixed(1);

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
                        ami,
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
                        sami,
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