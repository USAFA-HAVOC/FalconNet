import 'package:flutter/material.dart';

import 'PaddedColumn.dart';

class PageWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const PageWidget({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: PaddedColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            PaddedColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              padding: EdgeInsets.symmetric(vertical: 5),
              children: children,
            )
          ]
        )
    );
  }
}