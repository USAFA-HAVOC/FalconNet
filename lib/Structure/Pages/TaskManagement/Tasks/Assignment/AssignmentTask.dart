import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Database/UserSummaryList.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Assignment/AssignmentBar.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/SquadronAssignRequest.dart';
import '../../../../../Model/Database/UnitAssignRequest.dart';
import '../../../../../Model/Database/UnitList.dart';
import '../../../../../Model/Database/UserSummary.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../../Utility/ErrorFormatting.dart';
import '../../../../Components/AsyncPage.dart';
import '../../../../Components/PageWidget.dart';
import '../../../../Components/SearchBar.dart';

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
  final AssignmentScope scope;
  final List<String> units;

  const AssignmentTask({super.key, required this.units, required this.scope});

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

    selected = widget.units.first;

    super.initState();
  }

  Future<AssignmentTaskData> retrieveData() async {
    try {
      var summaries = await Endpoints.getUserSummaries(null);
      UnitList? units;
      if (widget.scope == AssignmentScope.all) {
        units = await Endpoints.listUnits(null);
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
      var unit = UnitAssignRequest((u) => u
        ..unit = selected
        ..users = additions.map((e) => e.user_id).toBuiltList().toBuilder()
      );

      await Endpoints.assignUnit(unit);

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
    return AsyncPage(
        title: "Unit Assignment",
        connection: connection,
        placeholder: const [
          LoadingShimmer(height: 150,),

          LoadingShimmer(height: 500,)
        ],
        builder: (context, data) {
            var potential = data.summaries.users.toList();

            List<Widget> selection = [];

            if (widget.scope == AssignmentScope.all) {
              var units = data.units!.units.toList();
              selection = [DropdownButton<String>(
                items: units.map((u) => DropdownMenuItem<String>(
                  value: u.name,
                  child: Text(u.name),
                )).toList(),
                value: selected,
                onChanged: (change) => setState(() => selected = change!),
              )];
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

            List<Widget> removeContent = [SearchBar(onChanged: (q) => setState(() => query = q))];

            removeContent.addAll(search(potential, query).map((summary) => AssignmentBar(
                summary: summary,
                status: AssignmentStatus.excluded,
                onToggle: addUser
            )));

            var rems = PageWidget(
                title: "Select Members",
                children: removeContent
            );

            return [
              adds,

              rems
            ];
        }
    );
  }
}