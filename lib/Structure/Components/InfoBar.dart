import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  final List<Widget> children;
  final void Function()? onTap;
  final EdgeInsets interiorPadding;
  final EdgeInsets exteriorPadding;

  const InfoBar({
    super.key,
    required this.children,
    this.onTap,
    this.interiorPadding = const EdgeInsets.all(10),
    this.exteriorPadding = const EdgeInsets.symmetric(vertical: 10)
  });

  @override
  Widget build(BuildContext context) {
    Widget formatted = DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),

        child: Padding(
          padding: interiorPadding,
          child: Row(
            children: children,
          ),
        )
    );

    if (onTap != null) {
      formatted = InkWell(
          onTap: onTap,
          child: formatted
      );
    }

    return Padding(
      padding: exteriorPadding,
      child: formatted
    );
  }
}