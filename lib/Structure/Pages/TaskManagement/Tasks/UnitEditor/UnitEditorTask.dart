import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UnitList.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitEditor/UnitBar.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitEditor/UnitForm.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/Unit.dart';
import '../../../../../Model/Store/Endpoints.dart';

class UnitEditorTask extends StatefulWidget {
  const UnitEditorTask({super.key});

  @override
  State<UnitEditorTask> createState() => UnitEditorTaskState();
}

class UnitEditorTaskState extends State<UnitEditorTask> {
  late Future<UnitList> connection;
  String query = "";

  @override
  void initState() {
    connection = Endpoints.unitsGet(null)
        .onError((error, stackTrace) {
          displayError(prefix: "Unit Editor", exception: error!);
          return UnitList();
        });
    super.initState();
  }

  void add(ScaffoldMessengerState messenger, UnitSummary unit) async {
    var units = (await connection).units.toList();
    try {
      Unit complete = await Endpoints.unitCreate(unit.unit);

      setState(() {
        connection = Future<UnitList>.value(UnitList((w) => w
          ..units = ListBuilder(units + [UnitSummary((s) => s
              ..total = unit.total
              ..unsigned = unit.unsigned
              ..out = unit.out
              ..signed = unit.signed
              ..unit = complete.toBuilder()
          )])
        ));
      });

      messenger.showSnackBar(const SnackBar(
        content: Text("Successfully Added Unit"),
      ));
    }
    catch (e) {
      displayError(prefix: "Unit Editor", exception: e);
      messenger.showSnackBar(const SnackBar(
        content: Text("Failed to Add Unit"),
      ));
    }
  }

  void delete(ScaffoldMessengerState messenger, UnitSummary unit) async {
    var units = (await connection).units.toList();

    try {
      await Endpoints.unitDelete(unit.unit);

      setState(() {
        connection = Future<UnitList>.value(UnitList((w) => w
          ..units = ListBuilder(units.where((u) => u.unit.name != unit.unit.name))
        ));
      });

      messenger.showSnackBar(const SnackBar(
        content: Text("Successfully Delete Unit"),
      ));
    }

    catch (e) {
      displayError(prefix: "Unit Editor", exception: e);
      messenger.showSnackBar(const SnackBar(
        content: Text("Failed to Delete Unit"),
      ));
    }
  }

  void edit(ScaffoldMessengerState messenger, UnitSummary unit) async {
    var units = (await connection).units.toList();

    try {
      await Endpoints.unitEdit(unit.unit);

      setState(() {
        connection = Future<UnitList>.value(UnitList((w) => w
          ..units = ListBuilder([units.firstWhere((u) => u.unit.name == unit.unit.name)] + units.where((u) => u.unit.name != unit.unit.name).toList())
        ));
      });

      messenger.showSnackBar(const SnackBar(
        content: Text("Successfully Edit Unit"),
      ));
    }
    catch (e) {
      displayError(prefix: "Unit Editor", exception: e);
      messenger.showSnackBar(const SnackBar(
        content: Text("Failed to Edit Unit"),
      ));
    }
  }

  UnitList search(UnitList list) {
    var scores = list.units.toList().map((u) => MapEntry(u, u.unit.name.similarityTo(query))).toList();
    scores.sort((a, b) {
      var value = -a.value.compareTo(b.value);
      if (value == 0) {
        return a.key.unit.name.compareTo(b.key.unit.name);
      }
      return value;
    });
    return UnitList((l) => l..units = scores.map((u) => u.key).toList().build().toBuilder());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: connection,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            var list = search(snapshot.data!);
            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Unit Editor",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PageWidget(
                      title: "New Unit",
                      children: [
                        UnitForm(
                          onSubmit: (unit) => add(ScaffoldMessenger.of(context), unit),
                          list: list,
                        )
                      ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PageWidget(
                    title: "Edit Units",
                    children: [
                      ListView.builder(
                        itemCount: list.units.length + 1,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          if (index == 0) {
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
                            return UnitBar(
                              unit: list.units[index - 1],
                              onDelete: (unit) => delete(ScaffoldMessenger.of(context), unit),
                              onEdit: (unit) => edit(ScaffoldMessenger.of(context), unit),
                              list: list,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }

          else {
            return ListView(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Unit Editor",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: LoadingShimmer(height: 200,),
                )
              ],
            );
          }
        }
    );
  }
}