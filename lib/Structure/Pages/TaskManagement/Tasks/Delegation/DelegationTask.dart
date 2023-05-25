import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/RoleRequest.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import  'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/TimedRole.dart';
import '../../../../../Model/Database/Unit.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/AsyncPage.dart';
//import '../../../../Components/SearchBar.dart';
import 'DelegateBar.dart';
import 'DelegationForm.dart';

class DelegationData {
  final List<User> users;
  final List<Unit> units;

  const DelegationData({required this.units, required this.users});
}

///Applet for supervisors to assign time based roles to subordinates
///Allows for both adding, removing, and editing of roles of subordinates
class DelegationTask extends StatefulWidget {
  final List<TimedRole> owner;

  const DelegationTask({super.key, required this.owner});

  @override
  State<StatefulWidget> createState() => DelegationTaskState();
}

class DelegationTaskState extends State<DelegationTask> {
  late Future<DelegationData> connection;
  String query = "";

  @override
  void initState() {
    super.initState();
    connection = retrieveData();
  }

  Future<DelegationData> retrieveData() async {
    try {
      var users = (await Endpoints.getUsers(null)).users.toList();
      var units = (await Endpoints.listUnits(null)).units.toList();
      return DelegationData(units: units, users: users);
    }
    catch (e) {
      displayError(prefix: "Delegation", exception: e);
      return DelegationData(units: [], users: []);
    }
  }

  ///Assigns a delegate to a list of roles
  ///Makes api call and displays error message on failure
  Future<bool> assign(User delegate, List<TimedRole> roles, {ScaffoldMessengerState? messenger}) async {
    try {
      await Endpoints.setRoles(RoleRequest((r) => r
        ..user_id = delegate.id
        ..new_roles = roles.toBuiltList().toBuilder()
      ));

      var data = await connection;

      setState(() {
        var others = data.users.where((d) => d.id != delegate.id).toList();
        var modified = delegate.rebuild((d) => d..roles = roles.toBuiltList().toBuilder());
        var full = others + [modified];
        connection = Future.value(DelegationData(units: data.units, users: full));
      });

      messenger?.showSnackBar(
        const SnackBar(
          content: Text("Successfully Modified Roles")
        )
      );
    }

    catch (e) {
      displayError(prefix: "Delegation", exception: e);
      messenger?.showSnackBar(
        const SnackBar(
          content: Text("Failed to Modify Roles")
        )
      );
      return false;
    }
    return true;
  }

  ///Opens a dialog for the form for editing a delegates roles
  void openDelegationForm(BuildContext context, User delegate, List<TimedRole> applicable, List<Unit> units) {
    showDialog(context: context, builder: (context) => Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),

        //Builds a delegation form with applicable roles
        child: DelegationForm(
          units: units,
          delegate: delegate,
          applicable: applicable,
          onSubmit: (roles) {
            assign(delegate, roles, messenger: ScaffoldMessenger.of(context));
          },
          onCancel: () => Navigator.of(context).pop(),
        ),
      ),
    ));
  }

  List<User> search(List<User> applicable, String q) {
    var mutable = applicable.map((u) => MapEntry(u, u.personal_info.full_name.similarityTo(q))).toList();
    mutable.sort((a, b) => -a.value.compareTo(b.value));
    return mutable.map((u) => u.key).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Delegation",
        connection: connection,
        placeholder: const [
          LoadingShimmer(height: 700,)
        ],
        builder: (context, data) {
          var ordered = search(data.users, query);
          return [
            PageWidget(
              title: "Members",
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: ordered.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SearchBar(onChanged: (q) => setState(() => query = q));
                      }

                      return DelegateBar(
                          delegate: ordered[index - 1],
                          onAssign: (delegate) => openDelegationForm(context, delegate, widget.owner, data.units)
                      );
                    }
                ),
              ]
            )
          ];
        }
    );
  }
}