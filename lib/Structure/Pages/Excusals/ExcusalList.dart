import 'package:flutter/material.dart';

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

    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Center(
        child: Text("No excusals to display")
      ),
    );
  }
}