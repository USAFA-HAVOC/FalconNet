import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../SDO/SignBox.dart';
import 'Signee.dart';

///List displaying all squadron names and allowing SDO to sign di
class SigningWidget extends StatelessWidget {
  final Map<String, Signee>? di;
  final void Function(String) onSign;

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
      children: di!.map(
              (id, value) => MapEntry(
            id,
            SignBox(
              name: value.name,
              status: value.status,
              onSign: () => onSign(id),
            ),
          )
      ).values.toList(),
    );
  }
}