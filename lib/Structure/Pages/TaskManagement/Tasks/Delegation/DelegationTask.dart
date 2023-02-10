import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:flutter/material.dart';
import  'package:string_similarity/string_similarity.dart';

import '../../../../../Model/Database/Delegate.dart';
import '../../../../../Model/Database/TimedRole.dart';
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
  late Future<BuiltList<Delegate>> connection;
  String query = "";

  @override
  void initState() {
    super.initState();
    connection = Future.delayed(Duration(milliseconds: 250), () => BuiltList([
      Delegate((b) => b
          ..name = "Rylie Anderson"
          ..id = "ra"
          ..roles = BuiltList<TimedRole>([
            TimedRole((t) => t
                ..role = "cwoc"
                ..start = DateTime(2022, 11, 24)
                ..end = DateTime(2023, 1, 23))
          ]).toBuilder()
      ),
      Delegate((b) => b
        ..name = "Ethan Chapman"
        ..id = "ec"
        ..roles = BuiltList<TimedRole>([
          TimedRole((t) => t
            ..role = "sdo"
            ..start = DateTime(2022, 11, 24)
            ..end = DateTime(2023, 1, 23))
        ]).toBuilder()
      ),
      Delegate((b) => b
        ..name = "Enrique Oti"
        ..id = "eo"
        ..roles = BuiltList<TimedRole>([]).toBuilder()
      ),
      Delegate((b) => b
        ..name = "David Petzold"
        ..id = "dp"
        ..roles = BuiltList<TimedRole>([]).toBuilder()
      ),
    ]));
  }

  ///Assigns a delegate to a list of roles
  ///Makes api call and displays error message on failure
  void assign(Delegate delegate, List<TimedRole> roles, ScaffoldMessengerState messenger) async {

    /// todo: replace with api call
    var success = await Future.delayed(Duration(milliseconds: 250), () => true);

    if (success) {
      var current = await connection;

      setState(() {
        var others = current.toList().where((d) => d.id != d.id).toList();
        var modified = delegate.rebuild((d) => d.roles.addAll(roles));

        connection = Future.value(BuiltList(others + [modified]));
      });
    }
    else {
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Failed to modify roles")
        )
      );
    }
  }

  ///Opens a dialog for the form for editing a delegates roles
  void openDelegationForm(BuildContext context, Delegate delegate, List<TimedRole> applicable) {
    showDialog(context: context, builder: (context) => Dialog(
      insetPadding: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(5),

        //Builds a delegation form with applicable roles
        child: DelegationForm(
          delegate: delegate,
          applicable: applicable,
          onSubmit: (role) {
            assign(delegate, role, ScaffoldMessenger.of(context));
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        ),
      ),
    ));
  }

  List<Delegate> search(List<Delegate> applicable, String q) {
    var mutable = applicable;
    mutable.sort((a, b) {
      var first = a.name.toLowerCase();
      var second = b.name.toLowerCase();
      var query = q.toLowerCase();
      var firstScore = first.similarityTo(query);
      var secondScore = second.similarityTo(query);
      if (firstScore > secondScore) {
        return -1;
      }
      else if (secondScore > firstScore) {
        return 1;
      }
      return first.compareTo(second);
    });

    return mutable;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Role Delegation",
            style: Theme.of(context).textTheme.titleLarge
          ),
        ),

        FutureBuilder(
            future: connection,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                var ordered = search(snapshot.data!.toList(), query);
                return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: ordered.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(10)),
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              labelText: "Search",
                              suffixIcon: Icon(Icons.search)
                          ),
                          onChanged: (q) => setState(() => query = q),
                        );
                      }

                      return DelegateBar(
                          delegate: ordered[index - 1],
                          onAssign: (delegate) => openDelegationForm(context, delegate, widget.owner)
                      );
                    }
                );
              }
              else {
                return const LoadingShimmer(height: 200,);
              }
            }
        ),
      ]
    );
  }
}

