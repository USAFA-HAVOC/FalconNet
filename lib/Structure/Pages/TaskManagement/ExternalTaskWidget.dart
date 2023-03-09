import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Components/PageWidget.dart';

///Widget for directing user to another page to complete a task
///Used primarily for specialized user roles
///Such as CWOC controllers, Stan/Eval, or SDO
class ExternalTaskWidget extends StatelessWidget {
  final String path;
  final String title;
  final String description;

  const ExternalTaskWidget(
      {super.key,
      required this.path,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: title,
      children: [
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ElevatedButton(
          //Navigate to the tasks destination
          onPressed: () {
            context.go(path);
          },

          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Begin",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
