import 'package:flutter/material.dart';

import '../../../Model/Database/UserEvent.dart';

class ExcusalList<T> extends StatelessWidget {
  final List<T> excusals;
  final Widget Function(T) converter;
  final void Function(T) add;

  const ExcusalList({
    super.key,
    required this.excusals,
    required this.converter,
    required this.add,
  });

  @override
  Widget build(BuildContext context) {
    if (excusals.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: this.excusals.map((e) => converter(e)).toList(),
      );
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text("No excusals to display")
      ),
    );
  }
}