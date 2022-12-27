import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/FormOneWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../Model/Data/FormOne.dart';

///Page acting as general hub for all cadet tasks
///This includes both general, role specific, and unit specific tasks
///These tasks may route to other pages
class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  ///Builds all task types based on current state
  List<Widget> buildTasks(GlobalState state, BuildContext context) {
    var tasks = <Widget>[];

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
            "No current tasks",
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
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          return RefreshIndicator(

            //Call refresh method to find new tasks
            onRefresh: () {
              return Future.delayed(Duration(seconds: 1), () {
                print("Refreshed task management");
              });
            },

            //Important: Cannot use primary or shrink wrap, prevents reload
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                      "Task Management",
                      style: Theme.of(context).textTheme.titleLarge
                  ),
                ),

                ...buildTasks(store.state, context),
              ],
            ),
          );
        }
    );
  }
}