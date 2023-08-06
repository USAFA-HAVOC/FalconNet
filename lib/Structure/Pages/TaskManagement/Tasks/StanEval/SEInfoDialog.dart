import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../Components/InfoBar.dart';
import '../../../../Components/FNSearchBar.dart';

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
                  return FNSearchBar(onChanged: (q) => setState(() => query = q));
                }
                else {
                  var grade = ordered[index - 3];
                  return InfoBar(
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
                  );
                }
              }
          ),
        )
    );
  }
}