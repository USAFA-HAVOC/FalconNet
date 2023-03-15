import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/UserGrades.dart';
import '../../../../../Model/Database/UserSummary.dart';

class SEInfoDialog extends StatefulWidget {
  final Map<String, String> pairs;
  final String title;

  const SEInfoDialog({super.key, required this.title, required this.pairs});

  @override
  State<SEInfoDialog> createState() => SEInfoDialogState();
}

class SEInfoDialogState extends State<SEInfoDialog> {
  String query = "";

  List<MapEntry<String, String>> search() {
    var scores = widget.pairs.map((key, value) => MapEntry(MapEntry(key, value), key.similarityTo(query))).entries.toList();
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
              itemCount: widget.pairs.length + 3,
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }
                else if (index == 2) {
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
                  var grade = ordered[index - 3];
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
                                  grade.key,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.start,
                                ),
                              ),

                              Expanded(
                                flex: 2,
                                child: Text(
                                  grade.value.toString(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.center,
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