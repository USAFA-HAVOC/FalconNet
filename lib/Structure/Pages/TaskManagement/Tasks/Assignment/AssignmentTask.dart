import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Database/UserSummaryList.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Assignment/AssignmentBar.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/SquadronAssignRequest.dart';
import '../../../../../Model/Database/UnitAssignRequest.dart';
import '../../../../../Model/Database/UnitList.dart';
import '../../../../../Model/Database/UserSummary.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../../Utility/ErrorFormatting.dart';
import '../../../../Components/LoadingShimmer.dart';
import '../../../../Components/PageWidget.dart';

enum AssignmentType {
  unit,
  squadron,
}

enum AssignmentScope {
  own,
  all
}

class AssignmentTaskData {
  final UserSummaryList summaries;
  final UnitList? units;

  const AssignmentTaskData({required this.summaries, required this.units});
}

class AssignmentTask extends StatefulWidget {
  final AssignmentType type;
  final AssignmentScope scope;
  final UserPersonalInfo info;

  const AssignmentTask({super.key, required this.type, required this.info, required this.scope});

  @override
  State<AssignmentTask> createState() => AssignmentTaskState();
}

class AssignmentTaskState extends State<AssignmentTask> {
  late Future<AssignmentTaskData> connection;
  late String selected = "";
  List<UserSummary> additions = [];
  List<UserSummary> ignore = [];
  String query = "";

  @override
  void initState() {
    connection = retrieveData();

    if (widget.type == AssignmentType.unit) {
      selected = widget.info.unit!;
    }

    else {
      selected = widget.info.squadron!.toString();
    }

    super.initState();
  }

  Future<AssignmentTaskData> retrieveData() async {
    try {
      var summaries = await Endpoints.assignmentGet(null);
      UnitList? units;
      if (widget.scope == AssignmentScope.all && widget.type == AssignmentType.unit) {
        units = await Endpoints.unitsGet(null);
        //units.rebuild((u) => u..units.add("CS00"));
      }

      return AssignmentTaskData(summaries: summaries, units: units);
    }

    catch (e) {
      displayError(prefix: "Assignment", exception: e);
      return AssignmentTaskData(summaries: UserSummaryList(), units: UnitList());
    }
  }

  void removeUser(UserSummary user) {
    setState(() {
      additions.remove(user);
    });
  }

  void addUser(UserSummary user) {
    setState(() {
      additions.add(user);
    });
  }

  void submit(ScaffoldMessengerState messenger) async {
    try {
      if (widget.type == AssignmentType.squadron) {
        int? present = int.tryParse(selected);
        var valid = present != null ? present <= 40 && present > 0 : false;

        if (valid) {
          var squad = SquadronAssignRequest((s) => s
            ..squadron = present
            ..users = additions.map((e) => e.user_id).toBuiltList().toBuilder()
          );
          await Endpoints.squadAssign(squad);
        }

        else {
          messenger.showSnackBar(const SnackBar(
              content: Text("Invalid squadron")
          ));
        }
      }

      else {
        var unit = UnitAssignRequest((u) => u
          ..unit = selected
          ..users = additions.map((e) => e.user_id).toBuiltList().toBuilder()
        );

        await Endpoints.unitAssign(unit);
      }

      setState(() {
        ignore.addAll(additions);
        additions = [];
      });

      messenger.showSnackBar(const SnackBar(
          content: Text("Successfully assigned members")
      ));
    }

    catch (e) {
      displayError(prefix: "Assignment", exception: e);
      messenger.showSnackBar(const SnackBar(
        content: Text("Failed to assign members")
      ));
    }
  }

  List<UserSummary> search(List<UserSummary> applicable, String q) {
    var scores = applicable.map((e) => MapEntry(e, e.name.similarityTo(query)))
        .where((a) => !additions.any((b) => a.key == b) && !ignore.any((b) => a.key == b))
        .toList();
    scores.sort((a, b) => -1 * a.value.compareTo(b.value));
    return scores.map((e) => e.key).toList().sublist(0, scores.length);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: connection,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            var potential = snapshot.data!.summaries.users.toList();

            List<Widget> selection = [];

            if (widget.scope == AssignmentScope.all) {
              if (widget.type == AssignmentType.unit) {
                var units = snapshot.data!.units!.units.toList();
                selection = [DropdownButton<String>(
                  items: units.map((u) => DropdownMenuItem<String>(
                    value: u.unit.name,
                    child: Text(u.unit.name),
                  )).toList(),
                  value: selected,
                  onChanged: (change) => setState(() => selected = change!),

                )];
              }

              else {
                int? present = int.tryParse(selected);
                var valid = present != null ? present <= 40 && present > 0 : false;
                selection = [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Squadron",
                        suffixIcon: const Icon(Icons.numbers),
                        errorText: valid ? null: "Please enter a valid squadron"
                    ),
                    onChanged: (q) => setState(() => selected = q),
                  )
                ];
              }
            }

            List<Widget> addContent;
            if (additions.isEmpty) {
              addContent = [
                ...selection,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "No new members selected",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              ];
            }

            else {
              addContent = [
                ...selection,
                ElevatedButton(
                    onPressed: () => submit(ScaffoldMessenger.of(context)),
                    child: const Text("Add Members")
                )
              ];
              addContent.addAll(additions.map((summary) => AssignmentBar(
                  summary: summary,
                  status: AssignmentStatus.included,
                  onToggle: removeUser
              )));
            }

            var adds = PageWidget(
                title: "Selected",
                children: addContent
            );

            List<Widget> removeContent = [TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Search",
                  suffixIcon: const Icon(Icons.search)
              ),
              onChanged: (q) => setState(() => query = q),
            )];

            removeContent.addAll(search(potential, query).map((summary) => AssignmentBar(
                summary: summary,
                status: AssignmentStatus.excluded,
                onToggle: addUser
            )));

            var rems = PageWidget(
                title: "Select Members",
                children: removeContent
            );

            return FNPage(
                title: "${widget.type == AssignmentType.unit ? "Unit" : "Squadron"} Assignment",
                children: [
                  adds,

                  rems
                ],
            );
          }

          else {
            return FNPage(
              title: "${widget.type == AssignmentType.unit ? "Unit" : "Squadron"} Assignment",
              children: const [
                LoadingShimmer(height: 200,),

                LoadingShimmer(height: 200,)
              ],
            );
          }
        }
    );
  }
}