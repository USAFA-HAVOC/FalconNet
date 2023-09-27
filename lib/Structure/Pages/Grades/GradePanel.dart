import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/UserGrades.dart';
import '../../Components/PageWidget.dart';

class GradePanel extends StatefulWidget {
  final List<Grade> ordered;
  final String label;

  GradePanel({super.key, required List<Grade> grades, required this.label}) : 
      ordered = grades.sorted((a, b) => a.index.compareTo(b.index));

  @override
  State<StatefulWidget> createState() => GradePanelState();
}

class GradePanelState extends State<GradePanel> {
  late Map<int, bool> extensions;

  @override
  void initState() {
    closeExtensions();
    super.initState();
  }

  void closeExtensions() {
    extensions = Map<int, bool>.fromEntries(List<MapEntry<int, bool>>.generate(
        widget.ordered.length,
            (index) => MapEntry(widget.ordered[index].index, false)
    ));
  }

  ///Builds an extension panel for a particular grade with expansion state
  ///Works for both sami and ami grades
  Widget buildGradePanelWeb(BuildContext context, String description, Grade grade, bool expanded) {
    return InfoBar(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                description,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.left,
              ),
          ),

          Expanded(
            flex: 5,
              child: Text(
                grade.description ?? "No description given",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
          ),

          Expanded(
            flex: 1,
            child: Text(
              grade.score.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ]
    );
  }

  ///Builds an extension panel for a particular grade with expansion state
  ///Works for both sami and ami grades
  ExpansionPanel buildGradePanel(BuildContext context, String description, Grade grade, bool expanded) {
    return ExpansionPanel(
        backgroundColor: Theme.of(context).cardTheme.color,
        isExpanded: expanded,
        headerBuilder: (context, open) => Padding(
          padding: const EdgeInsets.all(10),
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

        body: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            child: Text(
              grade.description == null || grade.description?.isEmpty == true ? "No description given" : grade.description!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: widget.label,
      children: [
        if (widget.ordered.isEmpty) Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            "No ${widget.label} scores to display",
            textAlign: TextAlign.center,
          ),
        ),

        if (kIsWeb && widget.ordered.isNotEmpty) Column(
          children: widget.ordered.map(
                  (grade) => buildGradePanelWeb(
                  context,
                  "${widget.label} #${(grade.index + 1).toString()}",
                  grade,
                  extensions.entries.toList().firstWhere((element) => element.key == grade.index).value
              )
          ).toList(),
        )

        else if (widget.ordered.isNotEmpty) ExpansionPanelList(

          //Closes all panels other than current one
          expansionCallback: (index, status) {
            setState(() {
              closeExtensions();
              extensions[widget.ordered[index].index] = !status;
            });
          },

          children: widget.ordered.map(
            (grade) => buildGradePanel(
                context,
                "${widget.label} #${(grade.index + 1).toString()}",
                grade,
                extensions.entries.toList().firstWhere((element) => element.key == grade.index).value
            )
          ).toList(),
        ),
      ],
    );
  }
}