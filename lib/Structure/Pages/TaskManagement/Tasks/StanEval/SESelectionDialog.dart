import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/StanEval/SEEvent.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:string_similarity/string_similarity.dart';

class SESelectionDialog<T> extends StatefulWidget {
  final Map<String, T> contents;
  final void Function(T) onAdd;

  const SESelectionDialog({super.key, required this.contents, required this.onAdd});

  @override
  State<SESelectionDialog> createState() => SESelectionDialogState<T>();
}

class SESelectionDialogState<T> extends State<SESelectionDialog> {
  String query = "";

  List<MapEntry<String, T>> search() {
    var scores = (widget.contents as Map<String, T>).map((key, value) => MapEntry(MapEntry(key, value), key.similarityTo(query))).entries.toList();
    scores.sort((a, b) => -a.value.compareTo(b.value));
    return scores.map((e) => e.key).toList();
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
              itemCount: ordered.length + 2,
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
                  var member = ordered[index - 2];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).dividerColor),
                      ),

                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  member.key,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.start,
                                ),
                              ),

                              Expanded(
                                  flex: 2,
                                  child: IconButton(
                                    onPressed: () {
                                      (widget as SESelectionDialog<T>).onAdd(member.value);
                                      context.pop();
                                    },
                                    icon: const Icon(Icons.add),
                                  )
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