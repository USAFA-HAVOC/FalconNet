import 'package:falcon_net/Model/Data/DIStatus.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/SDO/SDOSigningWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/SDO/SDOStatusWidget.dart';
import 'package:flutter/material.dart';

import 'SignBox.dart';

///Task for completing DI as Squadron SDO
///Shows present status and allows SDO to sign individuals' DIs
class SDOTask extends StatefulWidget {
  const SDOTask({super.key});

  @override
  State<SDOTask> createState() => SDOTaskState();
}

class SDOTaskState extends State<SDOTask> {
  late Future<Map<String, DIStatus>?> future;

  @override
  void initState() {
    super.initState();
    future = Future<Map<String, DIStatus>?>.delayed(Duration(seconds: 1), () => {
      "Rylie Anderson" : DIStatus.unsigned,
      "David Petzold" : DIStatus.signedDI,
      "Ethan Chapman" : DIStatus.signedOut,
      "Enrique Oti" : DIStatus.unsigned,
    });
  }

  void sign(String name, ScaffoldMessengerState messenger) async {
    var di = await future;
    if (di != null) {
      di[name] = DIStatus.signedDI;

      //api call
      var result = Future<bool>.delayed(Duration(seconds: 1), () => true);

      setState(() {
        future = Future<Map<String, DIStatus>?>.value(di);
      });

      result.then((success) {
        if (!success) {
          future.then((actual) {
            var mutable = actual!;
            mutable[name] = DIStatus.unsigned;
            messenger.showSnackBar(
                SnackBar(content: Text("Failed to sign di"))
            );
            setState(() {
              future = Future<Map<String, DIStatus>?>.value(mutable);
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, DIStatus>?>(
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
                child: SDOSigningWidget(di: di, onSign: (name) => sign(name, messenger),),
              ),
            ],
          ),
        );
      }
    );
  }
}

