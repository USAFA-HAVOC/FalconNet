import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Role.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/ExternalTaskWidget.dart';
import 'package:flutter/material.dart';

///Page acting as general hub for all cadet tasks
///This includes both general, role specific, and unit specific tasks
///These tasks may route to other pages
class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<StatefulWidget> createState() => TaskManagementState();
}

class TaskManagementState extends State<TaskManagement> {
  String query = "";

  ///Builds all task types based on current state
  List<Widget> buildTasks(GlobalState state, BuildContext context) {
    var tasks = <Widget>[];

    bool admin = state.user.roles.any((role) => role.isAdmin());

    //Add role-based tasks in order of precedent based on roles and available forms
    if (state.user.roles.any((r) => r.name == Roles.fn_admin.name)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/unit_editor",
          title: "Unit Editor",
          description: "Create new units and edit existing ones."));
    }

    if (admin) {
      tasks.addAll(const [
        ExternalTaskWidget(
            path: "/task_management/delegation",
            title: "Delegation",
            description: "Assign cadet roles and responsibilities."),
        ExternalTaskWidget(
          path: "/task_management/unit_assignment",
          title: "Unit Assignment",
          description: "Assign cadets to their appropriate unit.",
        ),
        ExternalTaskWidget(
            path: "/task_management/accountability",
            title: "Accountability",
            description:
                "Locate unit members whether they are on pass, leave, or on base.")
      ]);
    }

    if (state.user.roles.any((role) => role.name == Roles.unit_admin.name)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/unit_management",
          title: "Unit Management",
          description: "Manage passes for your unit."));
    }

    if (state.user.roles.any((role) => role.name == Roles.cwoc.name)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/cwoc",
          title: "CWOC",
          description:
              "Wing-wide accountability data for CWOC controllers. Allows controllers to view group, unit, and individual DI status."));
    }

    if (state.user.roles.any((role) => role.name == Roles.stan_eval.name)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/stan_eval",
          title: "Stan/Eval",
          description:
              "Entry point for stan/eval staff to assign grade and view unit-level analytics."));
    }

    if (state.user.roles.any((role) => role.name == Roles.sdo.name) || admin) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/sdo",
          title: "SDO",
          description: "Perform DI for your unit."));
    }

    if (state.user.roles
            .any((role) => role.name == Roles.accountability_rep.name) ||
        admin) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/event_signing",
          title: "Event Signing",
          description: "Take accountability for your squadron."));
    }

    //If no relevant tasks, display no tasks message
    if (tasks.isEmpty) {
      //Calculate height of message box as 70 percent of viewport
      var height = MediaQuery.of(context).size.height * 0.7;
      height = height < 0 ? 50 : height;

      return [
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: height),
          child: Center(
            child: Text(
              "No tasks right now",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                  color: Colors.grey),
            ),
          ),
        )
      ];
    }

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<GlobalState>>(
        converter: (store) =>
            ViewModel<GlobalState>(store: store, content: store.state),
        builder: (context, model) {
          return FNPage(
              title: "Task Management",
              children: buildTasks(model.content, context));
        });
  }
}
