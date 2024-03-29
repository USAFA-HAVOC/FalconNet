import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/UnitList.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/FNSearchBar.dart';

class StanEvalTask extends StatefulWidget {
  const StanEvalTask({super.key});

  @override
  State<StatefulWidget> createState() => StanEvalTaskState();
}

class StanEvalTaskState extends State<StanEvalTask> {
  late Future<UnitList> connection;
  String query = "";

  @override
  void initState() {
    connection = Endpoints.listUnits(null)
      .catchError((error) {
        displayError(prefix: "StanEval", exception: error);
        return UnitList();
      });
    super.initState();
  }

  UnitList search(UnitList list) {
    var scores = list.units.toList().map((u) => MapEntry(u, u.name.similarityTo(query))).toList();
    scores.sort((a, b) {
      var value = -a.value.compareTo(b.value);
      if (value == 0) {
        return a.key.name.compareTo(b.key.name);
      }
      return value;
    });
    return UnitList((l) => l..units = scores.map((u) => u.key).toList().build().toBuilder());
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Stan/Eval",
        connection: connection,
        placeholder: const [
          LoadingShimmer(height: 200,),

          LoadingShimmer(height: 500,)
        ],
        builder: (context, units) {
          var ordered = search(units);
          return [
            PageWidget(
              title: "Units",
              children: [
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: units.units.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return FNSearchBar(onChanged: (q) => setState(() => query = q));
                    }

                    else {
                      return InfoBar(
                        interiorPadding: const EdgeInsets.all(20),
                        onTap: () => context.go(
                            "/task_management/stan_eval/unit",
                            extra: ordered.units[index - 1].name
                        ),
                        children: [
                          Expanded(
                            child: Text(
                              ordered.units[index - 1].name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        ],
                      );
                    }
                  },
                )
              ]
            )
          ];
        }
    );
  }
}