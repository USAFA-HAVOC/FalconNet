import 'dart:async';

import 'package:falcon_net/Model/Database/DIRequest.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../Model/Database/UnitData.dart';
import '../../../../Model/Database/UserSummary.dart';
import '../../../Components/AsyncPage.dart';
import '../../../Components/LoadingShimmer.dart';
import '../../../Components/PageWidget.dart';
import 'Shared/SigningWidget.dart';

///Task for completing DI as Squadron SDO
///Shows present status and allows SDO to sign individuals' DIs
class SDOTask extends StatefulWidget {
  final String label;

  const SDOTask({super.key, this.label = "SDO"});

  @override
  State<SDOTask> createState() => SDOTaskState();
}

class SDOTaskState extends State<SDOTask> {
  late Future<UnitData> future;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    future = Endpoints.getOwnUnit(null)
        .catchError((error, stackTrace) {
          displayError(prefix: "SDO", exception: error);
          return UnitData();
        });

    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        future = Endpoints.getOwnUnit(null)
            .catchError((error, stackTrace) {
          displayError(prefix: "SDO", exception: error);
          return UnitData();
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void sign(UserSummary member, ScaffoldMessengerState messenger) async {
    var unit = await future;
    try {
      await Endpoints.signOther(DIRequest((b) => b..cadet_id = member.user_id));

      setState(() {
        future = Future<UnitData>.value(unit.sign(member));
      });
    }
    catch(e) {
      messenger.showSnackBar(
        const SnackBar(content: Text("Failed to sign"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
      title: widget.label,
      connection: future,
      placeholder: const [
        LoadingShimmer(height: 200,),

        LoadingShimmer(height: 500,)
      ],
      builder: (context, data) => [
        UnitStatusWidget(data: data),

        PageWidget(
          title: "Inspections",
          children: [
            SigningWidget(di: data, onSign: (member) => sign(member, ScaffoldMessenger.of(context)),),
          ],
        )
      ]
    );
  }
}

