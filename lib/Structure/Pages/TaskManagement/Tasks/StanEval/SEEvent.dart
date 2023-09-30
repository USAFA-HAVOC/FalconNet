import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/GradeSubmission.dart';
import 'package:falcon_net/Model/Database/GradeType.dart';
import 'package:falcon_net/Model/Database/StanEvalUser.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/GradeBoard.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEInfoDialog.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEParameters.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEScoringDeductions.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SESelectionDialog.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitGrades.dart';
import '../../../../../Model/Database/UserGrades.dart';
import '../../../../../Model/Store/Endpoints.dart';

class SEEvent extends StatefulWidget {
  final GradeType type;
  final int index;
  final List<StanEvalUser> members;
  final UnitGrades grades;

  SEEvent({super.key, required SEEventParameters parameters})
      : type = parameters.type,
        index = parameters.index,
        members = parameters.members,
        grades = parameters.grades;

  @override
  State<StatefulWidget> createState() => SEEventState();
}

class SEEventState extends State<SEEvent> {
  TextEditingController score = TextEditingController();
  TextEditingController description = TextEditingController();
  List<StanEvalUser> gradees = [];
  String? scoreError;
  String? descriptionError;

  List<Widget> buildGradeeBars() => gradees
      .map((gradee) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          gradee.name,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      IconButton(
                          onPressed: () => setState(() => gradees.remove(gradee)),
                          icon: const Icon(Icons.delete))
                    ],
                  )
              ),
            ),
          )
  ).toList();

  Map<String, List<StanEvalUser>> ungradedRooms() {
    Map<StanEvalUser, Grade> grades = GradeBoard
        .fromUnitGrades(unit: widget.grades)
        .getRow(widget.type, widget.index);
    var ungraded = widget.members.where((m) => !grades.containsKey(m)).toList();
    var rooms = ungraded
        .map((u) => u.room)
        .toSet()
        .toList()
        .map((e) => [e])
        .reduce((carry, value) => carry + value)
        .where((element) => element != null)
        .map((r) => MapEntry(r!, widget.members.where((m) => m.room == r).toList()));

    return Map.fromEntries(rooms);
  }

  void submit(ScaffoldMessengerState messenger, String graderID) async {
    int? parsedScore = int.tryParse(score.text);

    if (parsedScore == null) {
      setState(() {
        scoreError = "Please enter a valid numeric score";
      });
    } else if (parsedScore > 100 || parsedScore < 0) {
      setState(() {
        scoreError = "Please enter a score between 0 and 100";
      });
    } else if (description.text.isEmpty && parsedScore < 100) {
      setState(() {
        scoreError = null;
        descriptionError = "Discrepancies required for non-perfect scores";
      });
    } else if (gradees.isEmpty) {
      setState(() {
        scoreError = null;
        descriptionError = null;
      });
      messenger.showSnackBar(
          const SnackBar(content: Text("Gradee List Cannot Be Empty")));
    } else {
      setState(() {
        descriptionError = null;
        scoreError = null;
      });
      try {
        await Endpoints.setGrades(GradeSubmission((s) => s
          ..value = parsedScore
          ..description = description.text
          ..type = widget.type.name
          ..number = widget.index
          ..cadets = gradees.map((g) => g.user_id).toList().build().toBuilder()
          ..grader_id = graderID));
        messenger.showSnackBar(const SnackBar(content: Text("Successfully Submitted Grade")));
        setState(() {
          scoreError = null;
          descriptionError = null;
          score.text = "";
          description.text = "";
          gradees = <StanEvalUser>[];
        });
      } catch (e) {
        displayError(prefix: "S/E Event", exception: e);
        messenger.showSnackBar(
            const SnackBar(content: Text("Failed to Submitted Grade")));
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    Map<String, List<StanEvalUser>> rooms = {};
    for (var member in widget.members) {
      if (member.room != null) {
        if (rooms[member.room] == null) rooms[member.room!] = [];
        rooms[member.room]!.add(member);
      }
    }

    return StoreConnector<GlobalState, String>(
        converter: (model) => model.state.user.id!,
        builder: (context, id) => FNPage(
                title: "Submit ${widget.type.display()} #${(widget.index + 1).toString()}",
                children: [
                  PageWidget(title: "Gradees", children: [
                    if (gradees.isEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          "No gradees currently selected",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (gradees.isNotEmpty) ...buildGradeeBars(),

                    ElevatedButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) =>
                            SESelectionDialog<List<StanEvalUser>>(
                                contents: ungradedRooms(),
                                onAdd: (roommates) => setState(() =>
                                  gradees.addAll(roommates.where(
                                    (member) =>
                                    !gradees.any((g) => g.user_id == member.user_id)
                                  ))
                                )
                            )
                        ),
                        child: const Text(
                            "Add Ungraded Room"
                        )
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Expanded(child: ElevatedButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (context) =>
                                    SESelectionDialog<List<StanEvalUser>>(
                                        contents: rooms,
                                        onAdd: (roommates) => setState(() =>
                                            gradees.addAll(roommates.where(
                                                    (member) => !gradees.any((g) =>
                                                g.user_id ==
                                                    member.user_id)))))),
                            child: const Text(
                                "Add Room"
                            )
                        )),

                        Expanded(child: ElevatedButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (context) => SESelectionDialog<
                                    StanEvalUser>(
                                    contents: Map<String, StanEvalUser>.fromEntries(
                                        widget.members
                                            .where((m) => !gradees
                                            .any((g) => g.user_id == m.user_id))
                                            .map((m) => MapEntry(m.name, m))),
                                    onAdd: (member) =>
                                        setState(() => gradees.add(member)))),
                            child: const Text("Add Cadet")
                        ))
                      ],
                    )
                  ]),

                  PageWidget(
                    title: "Submission",
                    children: [
                        TextField(
                          controller: score,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).dividerColor),
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              labelText: "Score",
                              suffixIcon: const Icon(Icons.numbers),
                              errorText: scoreError),
                        ),
                        TextField(
                          controller: description,
                          minLines: 3,
                          maxLines: 8,
                          style: Theme.of(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).dividerColor),
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              labelText: "Description",
                              suffixIcon: const Icon(Icons.description),
                              errorText: descriptionError),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SEInfoDialog(
                                title: widget.type == GradeType.pai
                                    ? "PAI Scoring Guide"
                                    : "Room Scoring Guide",
                                pairs: (widget.type == GradeType.pai ? paiDeductions : roomDeductions)
                                    .map((key, value) => MapEntry(key, value.toString())),
                              ),
                            );
                          },
                          child: const Text("Open Scoring Guide"),
                        ),
                        ElevatedButton(
                            onPressed: () =>
                                submit(ScaffoldMessenger.of(context), id),
                            child: const Text("Submit")),
                    ]
                  )
            ]
        )
    );
  }
}
