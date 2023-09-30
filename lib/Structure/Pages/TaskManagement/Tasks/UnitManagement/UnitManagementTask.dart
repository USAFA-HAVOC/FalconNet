import 'dart:core';
import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/IndividualPassStatus.dart';
import 'package:falcon_net/Model/Database/PassStatusRequest.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/UnitManagement/IndividualStatusWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/Role.dart';
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
      var data = await Endpoints.getUnitManagementThing(null);
      //var forms = await Endpoints.getFormData(null);
      return UnitManagementData(
          status: data.unit.pass_status.toList(),
          users: data.members.toList(),
      );
    }

    catch (e) {
      displayError(prefix: "Unit Management", exception: e);
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
    return StoreConnector<GlobalState, ViewModel<List<TimedRole>>>(
        converter: (store) =>
            ViewModel(store: store, content: store.state.user.roles.toList()),
        builder: (context, model) => AsyncPage(
            title: "Unit Management",
            connection: connection,
            placeholder: const [
              LoadingShimmer(height: 250,),

              LoadingShimmer(height: 200,),

              LoadingShimmer(height: 300,),

              LoadingShimmer(height: 500,),
            ],
            builder: (context, data) {
              return [
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
                                  model.content.firstWhere((r) => r.name == Roles.unit_admin.name).unit!
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