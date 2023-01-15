import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Shared/CWOCData.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../SDO/SignBox.dart';
import 'Signee.dart';

///List displaying all squadron names and allowing SDO to sign di
class SigningWidget extends StatelessWidget {
  final UnitData? di;
  final void Function(Signee) onSign;

  const SigningWidget({super.key, required this.di, required this.onSign});

  @override
  Widget build(BuildContext context) {
    if (di == null) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: SizedBox(width: double.infinity, height: 100,),
        ),
      );
    }

    return ListView(
      primary: false,
      shrinkWrap: true,
      children: di!.members.map(
        (value) => SignBox(
          name: value.name,
          status: value.status,
          onSign: () => onSign(value),
        ),
      ).toList(),
    );
  }
}