import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UnitList.dart';
import 'package:falcon_net/Structure/Components/AsyncPage.dart';
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
    connection = Endpoints.listUnits(null)
        .onError((error, stackTrace) {
          displayError(prefix: "Unit Editor", exception: error!);
          return UnitList();
        });
    super.initState();
  }

  void add(ScaffoldMessengerState messenger, Unit unit, List<Unit> units) async {
    try {
      Unit complete = await Endpoints.createUnit(unit);

      setState(() {
        connection = Future<UnitList>.value(UnitList((w) => w
          ..units = ListBuilder([
            ...units,

            complete
          ])
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

  void delete(ScaffoldMessengerState messenger, Unit unit, List<Unit> units) async {
    try {
      await Endpoints.deleteUnit(unit);

      setState(() {
        connection = Future<UnitList>.value(UnitList((w) => w
          ..units = ListBuilder(units.where((u) => u.name != unit.name))
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

  void edit(ScaffoldMessengerState messenger, Unit unit, List<Unit> units) async {
    try {
      await Endpoints.editUnit(unit);

      setState(() {
        connection = Future<UnitList>.value(UnitList((w) => w
          ..units = ListBuilder([unit] + units.where((u) => u.name != unit.name).toList())
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
        title: "Unit Editor",
        connection: connection,
        placeholder: const [
          LoadingShimmer(height: 300,),

          LoadingShimmer(height: 500,),
        ],
        builder: (context, data) {
          var list = search(data);
          return [
            PageWidget(
                title: "New Unit",
                children: [
                  UnitForm(
                    onSubmit: (unit) => add(ScaffoldMessenger.of(context), unit, data.units.toList()),
                    list: list,
                  )
                ]
            ),

            PageWidget(
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
                        onDelete: (unit) => delete(ScaffoldMessenger.of(context), unit, data.units.toList()),
                        onEdit: (unit) => edit(ScaffoldMessenger.of(context), unit, data.units.toList()),
                        list: list,
                      );
                    }
                  },
                ),
              ],
            ),
          ];
        }
    );
  }
}