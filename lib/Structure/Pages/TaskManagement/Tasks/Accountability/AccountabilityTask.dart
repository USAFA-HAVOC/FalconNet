import 'dart:async';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';
import '../../../../../Model/Database/Role.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/FNSearchBar.dart';
import 'StatusDescription/StatusDescriptionWidget.dart';

class AccountabilityTask extends StatefulWidget {
  final String unit;
  const AccountabilityTask({super.key, required this.unit});
  @override
  State<StatefulWidget> createState() => AccountabilityTaskState();
}

class AccountabilityTaskState extends State<AccountabilityTask> {
  String query = "";
  late String unit;
  late Future<List<User>> connection;
  late Map<String, bool> expansions;
  late Timer timer;
  int selectedYear = 0; // default to "All"

  @override
  void initState() {
    super.initState();
    unit = widget.unit;
    StringRequest request = (StringRequestBuilder()..string = unit).build();
    connection = Endpoints.getUsers(request).then((list) => list.users
        .where((u) => !u.roles.any((r) => r.name == Roles.permanent_party.name))
        .toList());
    connection.then((users) => expansions = Map<String, bool>.fromIterables(
        users.map((m) => m.id!), List<bool>.filled(users.length, false)));
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        connection = Endpoints.getUsers(request).then((list) => list.users
            .where((u) =>
                !u.roles.any((r) => r.name == Roles.permanent_party.name))
            .toList())
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
    var scores = members
        .map((m) => MapEntry(m, m.personal_info.full_name.similarityTo(query)))
        .toList();
    scores.sort((a, b) {
      var relation = -a.value.compareTo(b.value);
      if (relation == 0) {
        String lastName0 = a.key.personal_info.full_name.split(' ').last;
        String lastName1 = b.key.personal_info.full_name.split(' ').last;
        return lastName0.compareTo(lastName1);
      }
      return relation;
    });
    return scores.map((s) => s.key).toList();
  }

  Widget buildPanelWeb(User user) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "C${4 - user.accountability!.class_year_idx}C ",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  user.personal_info.full_name,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.left,
                ),
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
                ),
              ),
            ],
          ),
        ),
        StatusDescriptionWidget(user: user)
      ]),
    );
  }

  ExpansionPanel buildExpansionPanel(User user, bool expanded) {
    return ExpansionPanel(
        canTapOnHeader: true,
        isExpanded: expanded,
        headerBuilder: (context, expanded) => Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "C${4 - user.accountability!.class_year_idx}C ${user.personal_info.full_name}",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.left,
                    ),
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
                    ),
                  ),
                ],
              ),
            ),
        body: StatusDescriptionWidget(user: user));
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Unit Accountability",
        connection: connection,
        builder: (context, users) {
          var filteredUsers = query.isNotEmpty ? search(users) : users;
          var ordered = search(filteredUsers
              .where((user) =>
                  selectedYear == 0 ||
                  user.accountability!.class_year_idx == (4 - selectedYear))
              .toList()
            );

          return [
            UnitStatusWidget.fromUsers(users: users),

            PageWidget(title: "Members", children: [
              DropdownButton<int>(
                value: selectedYear,
                onChanged: (int? value) {
                  setState(() {
                    selectedYear = value!;
                  });
                },
                items: [0, 1, 2, 3, 4]
                    .map((int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text(value == 0 ? 'All' : 'C${value}C'),
                        ))
                    .toList(),
              ),

              FNSearchBar(onChanged: (q) => setState(() => query = q)),
              if (kIsWeb)
                ListView(
                  shrinkWrap: true,
                  children: ordered
                      .enumeratedMap((m, index) => buildPanelWeb(m))
                      .toList(),
                )
              else
                ExpansionPanelList(
                  expansionCallback: (index, state) =>
                      setState(() => expansions[ordered[index].id!] = !state),
                  children: ordered
                      .enumeratedMap((m, index) => buildExpansionPanel(
                          m, expansions[ordered[index].id!]!))
                      .toList(),
                )
            ])
          ];
        });
  }
}
