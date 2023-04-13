import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/RoleRequest.dart';
import 'package:falcon_net/Model/Database/Roles.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/SearchBar.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:flutter/material.dart';
import  'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/TimedRole.dart';
import '../../../../../Model/Database/User.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/AsyncPage.dart';
import 'DelegateBar.dart';
import 'DelegationForm.dart';

///Applet for supervisors to assign time based roles to subordinates
///Allows for both adding, removing, and editing of roles of subordinates
class DelegationTask extends StatefulWidget {
  final List<TimedRole> owner;

  const DelegationTask({super.key, required this.owner});

  @override
  State<StatefulWidget> createState() => DelegationTaskState();
}

class DelegationTaskState extends State<DelegationTask> {
  late Future<List<User>> connection;
  String query = "";

  @override
  void initState() {
    super.initState();
    connection = retrieveData();
  }

  Future<List<User>> retrieveData() async {
    try {
      if (widget.owner.any((role) =>
        role.role == Roles.fn_admin.name ||
        role.role == Roles.wing_admin.name ||
        role.role == Roles.group_admin.name
      )) {
        return (await Endpoints.getUsers(null)).users.toList();
      }
      else {
        return (await Endpoints.getOwnUnit(null)).members.toList();
      }
    }
    catch (e) {
      displayError(prefix: "Delegation", exception: e);
      return <User>[];
    }
  }

  ///Assigns a delegate to a list of roles
  ///Makes api call and displays error message on failure
  Future<bool> assign(User delegate, List<TimedRole> roles, {ScaffoldMessengerState? messenger}) async {
    try {
      await Endpoints.setRoles(RoleRequest((r) => r
        ..user_id = delegate.id
        ..roles_to_add = roles.toBuiltList().toBuilder()
      ));

      var current = await connection;

      setState(() {
        var others = current.where((d) => d.id != delegate.id).toList();
        var modified = delegate.rebuild((d) => d..roles = roles.toBuiltList().toBuilder());
        var full = others + [modified];
        connection = Future.value(full);
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
  void openDelegationForm(BuildContext context, User delegate, List<TimedRole> applicable) {
    showDialog(context: context, builder: (context) => Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),

        //Builds a delegation form with applicable roles
        child: DelegationForm(
          delegate: delegate,
          applicable: applicable,
          onSubmit: (role) {
            assign(delegate, role);
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
          LoadingShimmer(height: 400,)
        ],
        builder: (context, members) {
          var ordered = search(members, query);
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
                          onAssign: (delegate) => openDelegationForm(context, delegate, widget.owner)
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

