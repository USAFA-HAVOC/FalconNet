import 'dart:core';
import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/IndividualPassStatus.dart';
import 'package:falcon_net/Model/Database/PassStatusRequest.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitManagement/IndividualStatusWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Role.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../../Model/Store/GlobalState.dart';
import '../../../../Components/AsyncPage.dart';
import '../../../../Components/ViewModel.dart';

class UnitManagementData {
  final List<bool> status;
  final List<IndividualPassStatus> users;

  const UnitManagementData({required this.status, required this.users});
}

class UnitManagementTask extends StatefulWidget {
  final User user;

  const UnitManagementTask({super.key, required this.user});

  @override
  State<UnitManagementTask> createState() => UnitManagementTaskState();
}

class UnitManagementTaskState extends State<UnitManagementTask> {
  late Future<UnitManagementData> connection;
  late String unit;
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

  Future<UnitManagementData> requestData([String? explicit]) async {
    try {
      unit = explicit ?? (widget.user.roles.where((r) => r.name == Roles.unit_admin.name).firstOrNull?.unit! ?? widget.user.assigned_unit!);

      var data = await Endpoints.getUnitManagementThing((StringRequestBuilder()..string = unit).build());

      return UnitManagementData(
          status: data.unit.pass_status.toList(),
          users: data.members.toList(),
      );
    }

    catch (e, stack) {
      displayError(prefix: "Unit Management", exception: e);
      print(stack);
      return const UnitManagementData(
          status: [true, true, true, true],
          users: [],
      );
    }
  }

  void setStatus(ScaffoldMessengerState messenger, int degree, bool status, String unit) async {
    try {
      var data = await connection;
      var mutable = data.status.toList();
      mutable[degree] = status;
      print(unit);
      await Endpoints.setPassStatus(PassStatusRequest((p) => p
          ..unit = unit
          ..index = degree
          ..status = status
      ));
      setState(() {
        connection = Future.value(UnitManagementData(
            status: mutable,
            users: data.users,
        ));
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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<User>>(
        converter: (store) =>
            ViewModel(store: store, content: store.state.user),
        builder: (context, model) => AsyncPage(
            title: "Unit Management",
            connection: connection,
            placeholder: [
              if (widget.user.roles.where((r) => r.name == Roles.unit_admin.name).length > 1) PageWidget(
                  title: "Select Unit",
                  children: [
                    DropdownButtonFormField<String>(
                      value: unit,
                      onChanged: (change) => setState(() {
                        if (change != null) {
                          connection = requestData(change);
                        }
                      }),
                      items: widget.user.roles
                          .where((r) => r.name == Roles.unit_admin.name)
                          .map((r) => r.unit!)
                          .map((r) => DropdownMenuItem<String>(
                        value: r,
                        child: Text(r),
                      )).toList(),
                    )
                  ]
              ),

              const LoadingShimmer(height: 300,),

              const LoadingShimmer(height: 500,),
            ],
            builder: (context, data) {
              return [
                if (widget.user.roles.where((r) => r.name == Roles.unit_admin.name).length > 1) PageWidget(
                    title: "Select Unit",
                    children: [
                      DropdownButtonFormField<String>(
                        value: unit,
                        onChanged: (change) => setState(() {
                          if (change != null) {
                            connection = requestData(change);
                          }
                        }),
                        items: widget.user.roles
                            .where((r) => r.name == Roles.unit_admin.name)
                            .map((r) => r.unit!)
                            .map((r) => DropdownMenuItem<String>(
                                value: r,
                                child: Text(r),
                            )).toList(),
                      )
                    ]
                ),

                PageWidget(
                    title: "Pass Status",
                    children: ["4-Degs", "3-Degs", "2-Degs", "Firsties"].asMap().map((index, key) => MapEntry(index, Row(
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
                              onChanged: (status) => setStatus(
                                  ScaffoldMessenger.of(context),
                                  index,
                                  status,
                                  unit
                              ),
                            )
                        )
                      ],
                    ))).values.toList()
                ),

                IndividualStatusWidget(users: data.users),
              ];
            }
        )
    );
  }
}