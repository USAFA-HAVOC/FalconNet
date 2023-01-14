import 'package:falcon_net/Model/Data/DIStatus.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/SigningWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/SDO/SDOStatusWidget.dart';
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
  late Future<Map<String, Signee>?> future;

  @override
  void initState() {
    super.initState();
    future = Future<Map<String, Signee>?>.delayed(Duration(seconds: 1), () =>
      {
        "ra" : Signee(name: "Rylie Anderson", id: "ra", status: DIStatus.signedOut),
        "ec" : Signee(name: "Ethan Chapman", id: "ec", status: DIStatus.signedDI),
        "eo" : Signee(name: "Enrique Oti", id: "eo", status: DIStatus.unsigned),
        "dp" : Signee(name: "David Petzold", id: "dp", status: DIStatus.unsigned),
      }
    );
  }

  void sign(String id, ScaffoldMessengerState messenger) async {
    var di = await future;
    if (di != null) {
      di[id] = Signee(name: di[id]!.name, id: id, status: DIStatus.signedDI);

      //api call
      var result = Future<bool>.delayed(Duration(seconds: 1), () => true);

      setState(() {
        future = Future<Map<String, Signee>?>.value(di);
      });

      result.then((success) {
        if (!success) {
          future.then((actual) {
            var mutable = actual!;
            mutable[id] = Signee(name: di[id]!.name, id: id, status: DIStatus.unsigned);
            messenger.showSnackBar(
              SnackBar(content: Text("Failed to sign di"))
            );
            setState(() {
              future = Future<Map<String, Signee>?>.value(mutable);
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, Signee>?>(
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
                    SigningWidget(di: di, onSign: (name) => sign(name, messenger),),
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

