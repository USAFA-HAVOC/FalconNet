import 'package:falcon_net/Model/Database/FormOneData.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:flutter/material.dart';

class FormBar extends StatelessWidget {
  final FormOneData form;
  final void Function(FormOneData) onOpen;
  final void Function(FormOneData) onDelete;

  const FormBar({super.key, required this.form, required this.onOpen, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    String completion;
    if (form.signatures.isEmpty) {
      completion = "0";
    }
    else {
      completion = (100 * (form.signatures.values.where((s) => s).length) / form.signatures.length).toStringAsFixed(1);
    }

    return InfoBar(
      onTap: () => onOpen(form),
      children: [
        Expanded(
            flex: 5,
            child: Text(
              form.title,
              style: Theme.of(context).textTheme.titleSmall,
            )
        ),

        Expanded(
            flex: 2,
            child: Text(
              "$completion%",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.end,
            )
        ),

        Expanded(
          flex: 1,
          child: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => showDialog(context: context, builder: (context) => ConfirmationDialog(
                title: "Delete ${form.title}",
                description: "Please confirm that you would like to delete form ${form.title} "
                    "and all associated signatures. This action cannot be undone.",
                onConfirm: () => onDelete(form)
            )),
          ),
        ),
      ],
    );
  }
}