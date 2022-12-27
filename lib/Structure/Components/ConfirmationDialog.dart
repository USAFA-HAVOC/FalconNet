import 'package:flutter/material.dart';

import 'PaddedColumn.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onConfirm;
  final void Function()? onCancel;

  const ConfirmationDialog({super.key, required this.title, required this.description, required this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: PaddedColumn(
            mainAxisSize: MainAxisSize.min,
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
                children: [
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onConfirm();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Confirm'),
                            ),
                          ),
                        ),
                      ),

                      Spacer(flex: 1),

                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (onCancel != null) {
                              onCancel!();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: const Text('Cancel'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}