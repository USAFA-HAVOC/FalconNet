import 'package:falcon_net/Model/Database/IndividualStatusRequest.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/SearchBar.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/UserSummary.dart';
import '../../../../../Model/Store/Endpoints.dart';

class IndividualStatusWidget extends StatefulWidget {
  final List<UserSummary> users;

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
          .where((user) => true/*!user.roles.any((r) => r.role == Roles.permanent_party.name)*/)
          .map((u) => MapEntry(
            u.user_id,
            true // individual pass status
          ))
    );
  }

  Widget buildStatus(BuildContext context, UserSummary user) {
    var messenger = ScaffoldMessenger.of(context);
    return InfoBar(
      exteriorPadding: EdgeInsets.zero,
      children: [
        Expanded(
            flex: 5,
            child: Text(
              user.name,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.start,
            )
        ),

        Expanded(
            flex: 2,
            child: Switch(
              value: status[user.user_id]!,
              onChanged: (bool value) async {
                try {
                  await Endpoints.setIndividualPassStatus(IndividualStatusRequest((r) => r
                    ..user_id = user.user_id
                    ..status = value
                  ));
                  setState(() => status[user.user_id] = value);
                  messenger.showSnackBar(const SnackBar(
                      content: Text("Successfully Modified Individual Pass Status")
                  ));
                }
                catch (error) {
                  displayError(prefix: "Unit Management", exception: error);
                  messenger.showSnackBar(const SnackBar(
                      content: Text("Failed to Modify Individual Pass Status")
                  ));
                }
              },
            )
        )
      ],
    );
  }

  List<Widget> buildAll(BuildContext context) {
    var scores = widget.users
        .map((u) => MapEntry(u, u.name.similarityTo(query)))
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