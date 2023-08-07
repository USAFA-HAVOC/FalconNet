import 'package:flutter/material.dart';

class FNPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets padding;

  const FNPage({
    super.key,
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.all(20)
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: padding,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        ...(children.map((c) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: c
        )))
      ],
    );
  }
}