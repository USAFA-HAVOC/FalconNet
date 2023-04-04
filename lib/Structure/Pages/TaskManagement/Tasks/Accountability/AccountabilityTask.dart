import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Store/Endpoints.dart';

class AccountabilityTask extends StatefulWidget {
  const AccountabilityTask({super.key});

  @override
  State<StatefulWidget> createState() => AccountabilityTaskState();
}

class AccountabilityTaskState extends State<AccountabilityTask> {
  String query = "";
  late Future<UnitData> connection;

  @override
  void initState() {
    super.initState();
    connection = Endpoints.getOwnUnit(null);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
      title: "Accountability",
      connection: connection,
      builder: (context, unit) => [
        UnitStatusWidget(data: unit),


      ]
    );
  }
}