import 'dart:core';
import 'package:falcon_net/Model/Database/PassStatusRequest.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitManagement/FormBar.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitManagement/FormStatusDialog.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/FormOneData.dart';
import '../../../../../Model/Database/FormSummary.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/AsyncPage.dart';

class UnitManagementData {
  final List<bool> status;
  final List<FormOneData> forms;

  const UnitManagementData({required this.status, required this.forms});
}

class UnitManagementTask extends StatefulWidget {
  const UnitManagementTask({super.key});

  @override
  State<UnitManagementTask> createState() => UnitManagementTaskState();
}

class UnitManagementTaskState extends State<UnitManagementTask> {
  late Future<UnitManagementData> connection;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  String query = "";
  String? titleValid;
  String? contentValid;

  @override
  void initState() {
    connection = requestData();
    super.initState();
  }

  Future<UnitManagementData> requestData() async {
    try {
      var status = await Endpoints.getOwnUnit(null);
      var forms = await Endpoints.getFormData(null);
      return UnitManagementData(status: status.unit.pass_status.toList(), forms: forms.forms.toList());
      //return const UnitManagementData(status: [true, true, true, true], forms: []);
    }

    catch (e) {
      displayError(prefix: "Unit Management", exception: e);
      return const UnitManagementData(status: [true, true, true, true], forms: []);
    }
  }

  void setStatus(ScaffoldMessengerState messenger, int degree, bool status) async {
    try {
      var data = await connection;
      var mutable = data.status.toList();
      mutable[degree] = status;
      await Endpoints.setPassStatus(PassStatusRequest((p) => p
          ..index = degree
          ..status = status
      ));
      setState(() {
        connection = Future.value(UnitManagementData(status: mutable, forms: data.forms));
      });

      messenger.showSnackBar(const SnackBar(
          content: Text("Successfully Updated Pass Status")
      ));
    }

    catch (e) {
      displayError(prefix: "Unit Management", exception: e);
      messenger.showSnackBar(const SnackBar(
          content: Text("Failed to Update Pass Status")
      ));
    }
  }

  void addForm(ScaffoldMessengerState messenger, FormSummary form) async {
    try {
      if (content.text.isEmpty || title.text.isEmpty) {
        if (content.text.isEmpty) {
          setState(() {
            contentValid = "Content cannot be empty";
          });
        }
        if (title.text.isEmpty) {
          titleValid = "Title cannot be empty";
        }
        return;
      }
      var data = await connection;

      var assigned = await Endpoints.addForm(form);

      setState(() {
        connection = Future.value(UnitManagementData(status: data.status, forms: [assigned] + data.forms));
      });

      messenger.showSnackBar(const SnackBar(
          content: Text("Successfully Added Form")
      ));

      setState(() {
        content.text = "";
        title.text = "";
      });
    }

    catch (e) {
      displayError(prefix: "Unit Management", exception: e);
      messenger.showSnackBar(const SnackBar(
          content: Text("Failed to Add Form")
      ));
    }
  }

  void deleteForm(ScaffoldMessengerState messenger, FormOneData form) async {
    try {
      var data = await connection;

      await Endpoints.removeForm(StringRequest((s) => s..string = form.form_id));

      var mutable = data.forms.toList();
      mutable.remove(form);
      setState(() {
        connection = Future.value(UnitManagementData(status: data.status, forms: mutable));
      });

      messenger.showSnackBar(const SnackBar(
          content: Text("Successfully Removed Form")
      ));

      setState(() {
        content.text = "";
        title.text = "";
      });
    }

    catch (e) {
      displayError(prefix: "Unit Management", exception: e);
      messenger.showSnackBar(const SnackBar(
          content: Text("Failed to Remove Form")
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Unit Management",
        connection: connection,
        placeholder: const [
          LoadingShimmer(height: 250,),

          LoadingShimmer(height: 200,),

          LoadingShimmer(height: 300,),
        ],
        builder: (context, data) {
            Widget existing;
            if (data.forms.isNotEmpty) {
              existing = ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: data.forms.length + 1,
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
                    return FormBar(
                      form: data.forms[index - 1],
                      onDelete: (form) => deleteForm(ScaffoldMessenger.of(context), form),
                      onOpen: (form) => showDialog(context: context, builder: (context) => FormStatusDialog(form: form)),
                    );
                  }
                },
              );
            }

            else {
              existing = Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "No existing forms",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              );
            }

          return [
            PageWidget(
                title: "Pass Status",
                children: ["Firsties", "2-Degs", "3-Degs", "4-Degs"].asMap().map((index, key) => MapEntry(index, Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                          key,
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ),

                    Expanded(
                        flex: 3,
                        child: Switch(
                          value: data.status[index],
                          onChanged: (status) => setStatus(ScaffoldMessenger.of(context), index, status),
                        )
                    )
                  ],
                ))).values.toList()
            ),

            PageWidget(
                title: "New Form",
                children: [
                  TextField(
                    controller: title,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      labelText: "Title",
                      suffixIcon: const Icon(Icons.title),
                      errorText: titleValid,
                    ),
                    onChanged: (_) => setState(() => titleValid = null),
                  ),

                  TextField(
                    controller: content,
                    minLines: 3,
                    maxLines: 8,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      labelText: "Content",
                      suffixIcon: const Icon(Icons.description),
                      errorText: contentValid,
                    ),
                    onChanged: (_) => setState(() => contentValid = null),
                  ),

                  ElevatedButton(
                      onPressed: () => addForm(ScaffoldMessenger.of(context), FormSummary((f) => f
                        ..title = title.text
                        ..description = content.text
                        ..signed = false
                      )),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Submit"),
                      )
                  )
                ]
            ),

            PageWidget(
                title: "Existing Forms",
                children: [
                  existing
                ]
            )
          ];
        }
    );
  }
}