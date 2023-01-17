import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/ExternalTaskWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/FormOneWidget.dart';
import 'package:flutter/material.dart';

import '../../../Model/Data/Role.dart';

///Page acting as general hub for all cadet tasks
///This includes both general, role specific, and unit specific tasks
///These tasks may route to other pages
class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  ///Builds all task types based on current state
  List<Widget> buildTasks(GlobalState state, BuildContext context) {
    var tasks = <Widget>[];

    //Add tasks in order of precedent based on roles and available forms
    if (state.roles.any((role) => role.isAdmin)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/delegation",
          title: "Delegation",
          description: "Imagine being in cadet leadership"
      ));
    }

    if (state.roles.any((role) => role == Role.cwoc)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/cwoc",
          title: "CWOC",
          description: "Imagine being a cwoc controller, that's depressing"
      ));
    }

    if (state.roles.any((role) => role == Role.sdo)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/sdo",
          title: "SDO",
          description: "Please perform DI for your squadron"
      ));
    }

    if (state.roles.any((role) => role == Role.jdo)) {
      tasks.add(const ExternalTaskWidget(
          path: "/task_management/ordering",
          title: "JDO",
          description: "Please order appropriate number of meals for your squadron"
      ));
    }

    //Add form one task widgets from state
    tasks.addAll(state.forms.where((f) => !f.signed).map((f) => FormOneWidget(form: f)));

    //If no relevant tasks, display no tasks message
    if (tasks.isEmpty) {

      //Calculate height of message box as 70 percent of viewport
      var height = MediaQuery.of(context).size.height * 0.7;
      height = height < 0 ? 50 : height;

      return [ConstrainedBox(
        constraints: BoxConstraints.expand(height: height),
        child: Center(
          child: Text(
            "No tasks right now",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                color: Colors.grey
            ),
          ),
        ),
      )];
    }

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<GlobalState>>(
        converter: (store) => ViewModel<GlobalState>(store: store, content: store.state),
        builder: (context, model) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                          "Task Management",
                          style: Theme.of(context).textTheme.titleLarge
                      ),
                    ),

                    ...buildTasks(model.content, context),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}