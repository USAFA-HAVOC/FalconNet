import 'package:falcon_net/Model/Database/IndividualStatusRequest.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/Roles.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';

class IndividualStatusWidget extends StatefulWidget {
  final List<User> users;

  const IndividualStatusWidget({super.key, required this.users});

  @override
  State<StatefulWidget> createState() => IndividualStatusWidgetState();
}

class IndividualStatusWidgetState extends State<IndividualStatusWidget> {
  String query = "";
  late Map<String, bool> status;
  static const length = 10;

  @override
  void initState() {
    super.initState();
    status = Map.fromEntries(
      widget.users
          .where((user) => !user.roles.any((r) => r.role == Roles.permanent_party.name))
          .map((u) => MapEntry(
            u.id!,
            u.pass_allocation?.individual_pass_status ?? true
          ))
    );
  }

  Widget buildStatus(BuildContext context, User user) => InfoBar(
    exteriorPadding: EdgeInsets.zero,
    children: [
      Expanded(
          flex: 5,
          child: Text(
            user.personal_info.full_name,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.start,
          )
      ),

      Expanded(
          flex: 2,
          child: Switch(
            value: status[user.id!]!,
            onChanged: (bool value) async {
              try {
                await Endpoints.setIndividualPassStatus(IndividualStatusRequest((r) => r
                  ..user_id = user.id!
                  ..status = value
                ));
                setState(() => status[user.id!] = value);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Successfully Modified Individual Pass Status")
                ));
              }
              catch (error) {
                displayError(prefix: "Unit Management", exception: error);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Failed to Modify Individual Pass Status")
                ));
              }
            },
          )
      )
    ],
  );

  List<Widget> buildAll(BuildContext context) {
    var scores = widget.users
        .map((u) => MapEntry(u, u.personal_info.full_name.similarityTo(query)))
        .toList();
    scores.sort((a, b) => -a.value.compareTo(b.value));
    bool extended = length < scores.length;
    var widgets = scores
        .sublist(0, extended ? length : scores.length)
        .map((s) => buildStatus(context, s.key))
        .toList();
    return [
      ...widgets,

      if (extended) Text(
        "···",
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Individual Status",
      children: [
        SearchBar(onChanged: (change) => setState(() => query = change)),

        ...buildAll(context)
      ]
    );
  }
}