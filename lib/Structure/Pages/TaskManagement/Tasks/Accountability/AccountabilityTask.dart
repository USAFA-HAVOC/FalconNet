import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Database/UserStatus.dart';
import '../../../../../Model/Store/Endpoints.dart';
import 'LeaveDescriptionWidget.dart';
import 'PassDescriptionWidget.dart';

class AccountabilityTask extends StatefulWidget {
  const AccountabilityTask({super.key});

  @override
  State<StatefulWidget> createState() => AccountabilityTaskState();
}

class AccountabilityTaskState extends State<AccountabilityTask> {
  String query = "";
  late Future<List<User>> connection;
  late Map<String, bool> expansions;

  @override
  void initState() {
    super.initState();
    connection = Endpoints.getUsers(null).then((list) => list.users.toList());
    connection.then((users) => expansions = Map<String, bool>.fromIterables(
        users.map((m) => m.id!),
        List<bool>.filled(users.length, false)
    ));
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

  ExpansionPanel buildExpansionPanel(User user, bool expanded) {
    Widget body;
    switch (user.status()) {
      case UserStatus.out:
        body = PassDescriptionWidget(pass: user.accountability!.current_pass!,);
        break;

      case UserStatus.leave:
        body = LeaveDescriptionWidget(leave: user.accountability!.current_leave!,);
        break;

      case UserStatus.unsigned:
        body = const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "User has not signed DI and is neither signed out nor on leave.",
            textAlign: TextAlign.start,
          ),
        );
        break;
        
      case UserStatus.signed:
        body = Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "DI signed by ${user.accountability!.di_signed_name} at ${describeTime(TimeOfDay.fromDateTime(user.accountability!.di_last_signed!))}",
            textAlign: TextAlign.start,
          ),
        );
        break;
    }
    return ExpansionPanel(
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
                    user.displayStatus(),
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  )
              ),
            ],
          ),
        ),
        body: body
    );
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
      title: "Accountability",
      connection: connection,
      builder: (context, users) {
        var ordered = search(users.toList());

        return [
          UnitStatusWidget.fromUsers(users: users),

          PageWidget(
            title: "Members",
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Search",
                  suffixIcon: const Icon(Icons.search)
                ),
                onChanged: (q) => setState(() => query = q),
              ),

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