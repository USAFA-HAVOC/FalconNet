import 'package:flutter/material.dart';

import 'PaddedColumn.dart';

///Widget for uniform in-page widgets
///Displayed as cards with a title and a column of children
class PageWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets padding;
  final EdgeInsets spacing;
  final bool hasShadow;

  const PageWidget({
    super.key,
    required this.title,
    required this.children,
    this.padding =
        const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 5),
    this.spacing = const EdgeInsets.symmetric(vertical: 5),
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    //Returns a card with spacing between title and body and uniform spacing between body children
    return Card(
      elevation: hasShadow ? 5 : 0,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: !hasShadow
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Theme.of(context).dividerColor),
            )
          : null,
      child: PaddedColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        padding: padding,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          PaddedColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            padding: spacing,
            children: children,
          ),
        ],
      ),
    );
  }
}
