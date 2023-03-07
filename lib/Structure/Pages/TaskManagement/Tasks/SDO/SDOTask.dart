import 'package:falcon_net/Model/Database/DIRequest.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/SigningWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/SDO/SDOStatusWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../Components/PageWidget.dart';

///Task for completing DI as Squadron SDO
///Shows present status and allows SDO to sign individuals' DIs
class SDOTask extends StatefulWidget {
  const SDOTask({super.key});

  @override
  State<SDOTask> createState() => SDOTaskState();
}

class SDOTaskState extends State<SDOTask> {
  late Future<UnitData?> future;

  @override
  void initState() {
    super.initState();

    future = Endpoints.sdo(null)
        .catchError((error, stackTrace) {
          displayError(prefix: "SDO", exception: error);
          return UnitData();
        });
  }

  void sign(User member, ScaffoldMessengerState messenger) async {
    var unit = await future;
    if (unit != null) {
      try {
        await Endpoints.sdoSign(DIRequest((b) => b..cadet_id = member.id));

        setState(() {
          future = Future<UnitData?>.value(unit.sign(member));
        });
      }
      catch(e) {
        messenger.showSnackBar(
          const SnackBar(content: Text("Failed to sign"))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UnitData?>(
      future: future,
      builder: (context, snapshot) {
        var di = snapshot.data;
        var messenger = ScaffoldMessenger.of(context);
        return FNPage(
          title: "SDO",
          children: [
            SDOStatusWidget(di: di),

            PageWidget(
              title: "Inspections",
              children: [
                SigningWidget(di: di, onSign: (member) => sign(member, messenger),),
              ],
            )
          ]
        );
      }
    );
  }
}

