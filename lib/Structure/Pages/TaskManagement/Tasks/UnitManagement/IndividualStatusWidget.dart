import 'package:falcon_net/Model/Database/IndividualPassStatus.dart';
import 'package:falcon_net/Model/Database/IndividualStatusRequest.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/FNSearchBar.dart';

class IndividualStatusWidget extends StatefulWidget {
  final List<IndividualPassStatus> users;

  const IndividualStatusWidget({Key? key, required this.users}) : super(key: key);

  @override
  State<StatefulWidget> createState() => IndividualStatusWidgetState();
}

class IndividualStatusWidgetState extends State<IndividualStatusWidget> {
  String query = "";
  late Map<String, bool> status;

  @override
  void initState() {
    super.initState();
    status = Map.fromEntries(
      widget.users.map((u) => MapEntry(u.user_id, u.individual_pass_status))
    );
  }

  Widget buildStatus(BuildContext context, IndividualPassStatus user) {
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
          ),
        ),
        Expanded(
          flex: 2,
          child: Switch(
            value: status[user.user_id]!,
            onChanged: (bool value) async {
              try {
                await Endpoints.setIndividualPassStatus(
                  IndividualStatusRequest((r) => r
                    ..user_id = user.user_id
                    ..status = value),
                );
                setState(() => status[user.user_id] = value);
                messenger.showSnackBar(const SnackBar(
                    content: Text("Successfully Modified Individual Pass Status")));
              } catch (error) {
                displayError(prefix: "Unit Management", exception: error);
                messenger.showSnackBar(const SnackBar(
                    content: Text("Failed to Modify Individual Pass Status")));
              }
            },
          ),
        )
      ],
    );
  }

  List<Widget> buildAll(BuildContext context) {
    // Sorting by last name
    var ordered = widget.users.toList()
      ..sort((p0, p1) {
        String lastName0 = p0.name.split(' ').last;
        String lastName1 = p1.name.split(' ').last;
        return lastName0.compareTo(lastName1);
      });

    var scores = ordered.map((u) => MapEntry(u, u.name.similarityTo(query))).toList();
    scores.sort((a, b) => -a.value.compareTo(b.value));
    return scores.map((s) => buildStatus(context, s.key)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Individual Status",
      children: [
        FNSearchBar(onChanged: (change) => setState(() => query = change)),
        ...buildAll(context)
      ],
    );
  }
}
