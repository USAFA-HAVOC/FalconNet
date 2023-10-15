import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UnitAssignRequest.dart';
import 'package:falcon_net/Model/Database/UserDelegates.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/Unit.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/AsyncPage.dart';
import '../../../../Components/FNSearchBar.dart';
import 'AssigneeBar.dart';
import 'AssignmentForm.dart';

class AssignmentData {
  final List<UserDelegates> users;
  final List<Unit> units;

  const AssignmentData({required this.units, required this.users});
}

class AssignmentTask extends StatefulWidget {
  final List<String> owner;

  const AssignmentTask({Key? key, required this.owner}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AssignmentTaskState();
}

class AssignmentTaskState extends State<AssignmentTask> {
  late Future<AssignmentData> connection;
  String query = "";

  @override
  void initState() {
    super.initState();
    connection = retrieveData();
  }

  Future<AssignmentData> retrieveData() async {
    var users = (await Endpoints.delegableUsers(null)).users.toList();
    var units = (await Endpoints.listUnits(null)).units.toList();

    return AssignmentData(units: units, users: users);
  }

  Future<bool> assign(
      UserDelegates assignee, List<String> units, String assigned,
      {ScaffoldMessengerState? messenger}) async {
    await Endpoints.setUnit(UnitAssignRequest((r) => r
      ..user = assignee.user_id
      ..units = units.build().toBuilder()
      ..assigned_unit = assigned));

    var data = await connection;

    setState(() {
      var others =
          data.users.where((d) => d.user_id != assignee.user_id).toList();
      var modified =
          assignee.rebuild((d) => d..units = units.build().toBuilder());
      var full = others + [modified];
      connection =
          Future.value(AssignmentData(units: data.units, users: full));
    });

    messenger?.showSnackBar(
        const SnackBar(content: Text("Successfully Set Units")));
    return true;
  }

  void openAssignmentForm(
      BuildContext context, UserDelegates assignee, List<Unit> units) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              insetPadding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: AssignmentForm(
                  units: units,
                  assignee: assignee,
                  owner: widget.owner,
                  onSubmit: (units, assigned) {
                    assign(assignee, units, assigned,
                        messenger: ScaffoldMessenger.of(context));
                  },
                  onCancel: () => Navigator.of(context).pop(),
                ),
              ),
            ));
  }

  List<UserDelegates> search(List<UserDelegates> applicable, String q) {
    var mutable =
        applicable.map((u) => MapEntry(u, u.name.similarityTo(q))).toList();
    mutable.sort((a, b) => -a.value.compareTo(b.value));
    return mutable.map((u) => u.key).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Unit Assignment",
        connection: connection,
        placeholder: const [
          LoadingShimmer(
            height: 700,
          )
        ],
        builder: (context, data) {
          var ordered = search(data.users, query);

          return [
            PageWidget(title: "Members", children: [
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: ordered.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return FNSearchBar(onChanged: (q) => setState(() => query = q));
                  }

                  return AssigneeBar(
                    units: data.units,
                    assignee: ordered[index - 1],
                    onAssign: (delegate) => openAssignmentForm(context, delegate, data.units)
                  );
                },
              ),
            ])
          ];
        });
  }
}
