import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/CWOCData.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/SigningWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/SDO/SDOStatusWidget.dart';
import 'package:falcon_net/Utility/UnitTesting.dart';
import 'package:flutter/material.dart';

import '../../../../Components/PageWidget.dart';
import '../Shared/Signee.dart';

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

    /// todo: replace with api call
    future = Future<UnitData?>.delayed(Duration(seconds: 1), () => generateUnit(generateInfo("CS12", 2)));
  }

  void sign(Signee member, ScaffoldMessengerState messenger) async {
    var unit = await future;
    if (unit != null) {

      /// todo: replace with api call
      var result = Future<bool>.delayed(Duration(milliseconds: 250), () => true);

      var success = await result;
      if (success) {
        setState(() {
          future = Future<UnitData?>.value(unit.sign(member));
        });
      }

      else {
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

        return Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                    "SDO",
                    style: Theme.of(context).textTheme.titleLarge
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SDOStatusWidget(di: di),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: PageWidget(
                  title: "Inspections",
                  children: [
                    SigningWidget(di: di, onSign: (member) => sign(member, messenger),),
                  ],
                )
              ),
            ],
          ),
        );
      }
    );
  }
}

