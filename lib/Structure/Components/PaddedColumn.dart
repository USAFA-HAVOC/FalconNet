import 'package:flutter/material.dart';

///Column subclass that wraps all children in a padding widget with the given edge insets
class PaddedColumn extends Column {
  PaddedColumn({
    super.key,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    required EdgeInsets padding,
    required List<Widget> children
  }) : super(
    children: children.map((child) => Padding(
      padding: padding,
      child: child,
    )).toList()
  );
}