import 'package:flutter/material.dart';

import '../../../Model/Database/UserGrades.dart';

class GradePanel extends StatefulWidget {
  final List<Grade> grades;
  final String label;

  const GradePanel({super.key, required this.grades, required this.label});

  @override
  State<StatefulWidget> createState() => GradePanelState();
}

class GradePanelState extends State<GradePanel> {
  late List<bool> extensions;

  @override
  void initState() {
    extensions = List<bool>.filled(widget.grades.length, false);
    super.initState();
  }

  ///Builds an extension panel for a particular grade with expansion state
  ///Works for both sami and ami grades
  ExpansionPanel buildGradePanel(BuildContext context, String description, Grade grade, bool expanded) {
    return ExpansionPanel(
        backgroundColor: Theme.of(context).cardTheme.color,
        isExpanded: expanded,
        headerBuilder: (context, open) => Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),

              Text(
                grade.score.toString(),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),

        body: Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  grade.description ?? "No description given",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "${widget.label}s",
          style: Theme.of(context).textTheme.titleMedium,
        ),

        ExpansionPanelList(

          //Closes all panels other than current one
          expansionCallback: (index, status) {
            setState(() {
              extensions = List<bool>.filled(extensions.length, false);
              extensions[index] = !status;
            });
          },

          children: widget.grades.asMap().map(
            (key, value) => MapEntry(
                key,
                buildGradePanel(
                    context,
                    "${widget.label} #${(key + 1).toString()}",
                    value,
                    extensions[key]
                )
            )
          ).values.toList(),
        ),
      ],
    );
  }
}