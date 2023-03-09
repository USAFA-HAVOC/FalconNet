import 'package:flutter/material.dart';
import 'package:falcon_net/Model/Database/FormData.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/UserSummary.dart';

class FormStatusDialog extends StatefulWidget {
  final FormData form;

  const FormStatusDialog({super.key, required this.form});

  @override
  State<FormStatusDialog> createState() => FormStatusDialogState();
}

class FormStatusDialogState extends State<FormStatusDialog> {
  String query = "";

  List<UserSummary> search() {
    var scores = widget.form.signatures.map((key, value) => MapEntry(MapEntry(key, value), key.name.similarityTo(query))).entries.toList();
    scores.sort((a, b) {
      var value = a.value.compareTo(b.value);
      if (value == 0) {
        return a.key.value == b.key.value ? a.key.key.name.compareTo(b.key.key.name) : (b.key.value ? -1 : 1);
      }
      return -value;
    });
    return scores.map((e) => e.key.key).toList();
  }

  @override
  Widget build(BuildContext context) {
    var ordered = search();

    return Dialog(
        backgroundColor: Theme.of(context).cardTheme.color,
        insetPadding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: widget.form.signatures.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CloseButton()
                    ],
                  );
                }
                else if (index == 1) {
                  return TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Search",
                        suffixIcon: const Icon(Icons.search)
                    ),
                    onChanged: (q) => setState(() => query = q),
                  );
                }
                else {
                  var summary = ordered[index - 2];
                  var signed = widget.form.signatures[summary]!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).dividerColor),
                      ),

                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  summary.name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.start,
                                ),
                              ),

                              Expanded(
                                flex: 4,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: signed ? Theme.of(context).highlightColor : Theme.of(context).disabledColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Theme.of(context).dividerColor),
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      signed ? "Signed" : "Unsigned",
                                      style: Theme.of(context).textTheme.titleSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  );
                }
              }
          ),
        )
    );
  }
}