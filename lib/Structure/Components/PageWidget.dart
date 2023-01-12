import 'package:flutter/material.dart';

import 'PaddedColumn.dart';

///Widget for uniform in-page widgets
///Displayed as cards with a title and a column of children
class PageWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const PageWidget({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {

    //Returns a card with spacing between title and body and uniform spacing between body children
    return Card(
        child: PaddedColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
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
            ),

          ]
        )
    );
  }
}