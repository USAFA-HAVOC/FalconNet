import 'package:flutter/foundation.dart';
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
        Container(
          constraints: const BoxConstraints(minHeight: kIsWeb ? 80 : 10),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          //Navigate to the tasks destination
          onPressed: () {
            context.go(path);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Open",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
