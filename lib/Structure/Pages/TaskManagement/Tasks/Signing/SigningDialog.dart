import 'package:flutter/material.dart';

import '../../../../../Theme/NegativeButtonTheme.dart';
import '../../../../Components/PaddedColumn.dart';

class SigningDialog extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onConfirm;
  final void Function()? onCancel;
  final void Function()? onExcuse;

  const SigningDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    this.onCancel,
    this.onExcuse
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PaddedColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
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

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    child: Text(
                      'Sign',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),

                  if (onExcuse != null) ElevatedButton(
                      onPressed: () => onExcuse!(),
                      child: Text(
                        "Excuse",
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                  ),

                  ElevatedButton(
                    style: Theme.of(context).extension<NegativeButtonTheme>()!.style,
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onCancel != null) {
                        onCancel!();
                      }
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}