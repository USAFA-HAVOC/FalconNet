import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Theme/NegativeButtonTheme.dart';
import 'PaddedColumn.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onConfirm;
  final void Function()? onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: kIsWeb
            ? const BoxConstraints(maxWidth: 450)
            : const BoxConstraints(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: PaddedColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              PaddedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                padding: const EdgeInsets.symmetric(vertical: 5),
                children: [
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onConfirm();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Confirm',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xffe8e8e8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (onCancel != null) {
                              onCancel!();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
