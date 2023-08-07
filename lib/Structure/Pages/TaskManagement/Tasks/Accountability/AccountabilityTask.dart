import 'dart:async';

import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/Role.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/FNSearchBar.dart';
import 'StatusDescription/StatusDescriptionWidget.dart';

class AccountabilityTask extends StatefulWidget {
  const AccountabilityTask({super.key});

  @override
  State<StatefulWidget> createState() => AccountabilityTaskState();
}

class AccountabilityTaskState extends State<AccountabilityTask> {
  String query = "";
  late Future<List<User>> connection;
  late Map<String, bool> expansions;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    connection = Endpoints.getUsers(null).then(
      (list) => list.users.where((u) => !u.roles.any((r) => r.name == Roles.permanent_party.name)).toList()
    );
    connection.then((users) => expansions = Map<String, bool>.fromIterables(
        users.map((m) => m.id!),
        List<bool>.filled(users.length, false)
    ));

    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        connection = Endpoints.getUsers(null).then(
            (list) => list.users.where(
              (u) => !u.roles.any((r) => r.name == Roles.permanent_party.name)
            ).toList()
        )
          ..then((members) {
            for (var member in members) {
              if (!expansions.containsKey(member.id!)) {
                expansions[member.id!] = false;
              }
            }
          });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  List<User> search(List<User> members) {
    var scores = members.map((m) => MapEntry(m, m.personal_info.full_name.similarityTo(query))).toList();
    scores.sort((a, b) {
      var relation = -a.value.compareTo(b.value);
      if (relation == 0) {
        return a.key.personal_info.full_name.compareTo(b.key.personal_info.full_name);
      }
      return relation;
    });
    return scores.map((s) => s.key).toList();
  }

  ExpansionPanel buildExpansionPanel(User user, bool expanded) => ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: expanded,
      headerBuilder: (context, expanded) => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Text(
                  user.personal_info.full_name,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.left,
                )
            ),

            Expanded(
                flex: 3,
                child: Text(
                  user.accountability?.current_leave != null
                      ? "On Leave"
                      : user.accountability?.current_pass != null
                          ? "Signed-Out"
                          : "Here",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                )
            ),
          ],
        ),
      ),
      body: StatusDescriptionWidget(user: user,)
  );

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
      title: "Unit Accountability",
      connection: connection,
      placeholder: const [
        LoadingShimmer(height: 200,),

        LoadingShimmer(height: 500,)
      ],
      builder: (context, users) {
        var ordered = search(users.toList());

        return [
          UnitStatusWidget.fromUsers(users: users),

          PageWidget(
            title: "Members",
            children: [
              FNSearchBar(onChanged: (q) => setState(() => query = q)),

              ExpansionPanelList(
                expansionCallback: (index, state) => setState(() => expansions[ordered[index].id!] = !state),
                children: ordered.enumeratedMap((m, index) => buildExpansionPanel(m, expansions[ordered[index].id!]!)).toList(),
              )
            ]
          )
        ];
      }
    );
  }
}