import 'dart:async';

import 'package:falcon_net/Model/Database/UserEventStatus.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Structure/Components/UnitStatusWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/SignRequest.dart';
import '../../../../../Model/Database/UnitData.dart';
import '../../../../../Model/Database/UserStatus.dart';
import '../../../../../Model/Database/UserSummary.dart';
import '../../../../../Utility/ErrorFormatting.dart';
import '../../../../Components/AsyncPage.dart';
import '../../../../Components/LoadingShimmer.dart';
import '../../../../Components/PageWidget.dart';
import 'SigningWidget.dart';

///Task for completing DI as Squadron SDO
///Shows present status and allows SDO to sign individuals' DIs
class UnitSigningEvent extends StatefulWidget {
  final String label;
  final String statusLabel;
  final String? event;
  final EdgeInsets padding;
  final FutureOr<UnitData> Function() retrieve;
  final int? refresh;

  const UnitSigningEvent({
    super.key,
    required this.label,
    required this.statusLabel,
    required this.event,
    required this.retrieve,
    this.padding = const EdgeInsets.all(20),
    this.refresh
  });

  @override
  State<UnitSigningEvent> createState() => UnitSigningEventState();
}

class UnitSigningEventState extends State<UnitSigningEvent> {
  late Future<UnitData> future;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    print(widget.event);

    future = Future.value(widget.retrieve())
        .catchError((error, stackTrace) {
          displayError(prefix: "Signing", exception: error);
          return Future<UnitData>.error(error);
        })

        ..then((value) {
          if (widget.refresh != null) {
            timer = Timer.periodic(Duration(seconds: widget.refresh!), (timer) {
              setState(() {
                future = Future.value(widget.retrieve())
                    .catchError((error, stackTrace) {
                      displayError(prefix: "Signing", exception: error);
                      return value;
                    });
              });
            });
          }

        });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  void sign(UserSummary member, UnitData data, ScaffoldMessengerState messenger) async {
    try {
      await Endpoints.signEvent(SignRequest((s) => s
        ..event_id = widget.event
        ..user_id = member.user_id
      ));

      setState(() {
        //future = Future<UnitData>.value(data.sign(member, event: widget.event));

        var mutated = data.rebuild((u) => u.members.map((m) =>
          m.user_id != member.user_id
            ? m
            : member.rebuild((m) =>
                m.status = (UserEventStatusBuilder()..status = UserStatus.signed.name)
              )
        ));

        future = Future<UnitData>.value(mutated);
      });

      messenger.showSnackBar(
          const SnackBar(content: Text("Successfully Signed"))
      );
    }
    catch(e) {
      displayError(prefix: "Signing", exception: e);
      messenger.showSnackBar(
        const SnackBar(content: Text("Failed to Sign"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
      title: widget.label,
      connection: future,
      padding: widget.padding,
      placeholder: const [
        LoadingShimmer(height: 200,),

        LoadingShimmer(height: 500,)
      ],
      builder: (context, data) => [
        UnitStatusWidget(data: data, event: widget.event,),

        PageWidget(
          title: widget.statusLabel,
          children: [
            SigningWidget(
              status: data,
              event: widget.event,
              onSign: (member) => sign(member, data, ScaffoldMessenger.of(context)),
            ),
          ],
        )
      ]
    );
  }
}

