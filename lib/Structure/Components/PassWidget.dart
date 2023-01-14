import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/PassAction.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

import '../../Model/Data/Pass.dart';
import '../../Model/Store/GlobalState.dart';
import 'PassStatus.dart';
import 'PassForm.dart';

///Page Widget for displaying current pass status and pass management ui
class PassWidget extends StatelessWidget {

  //Title of widget, defaults to "Pass Management"
  final String title;

  const PassWidget({super.key, this.title="Pass Management"});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<Pass?>>(
        converter: (store) => ViewModel<Pass?>(store: store, content: store.state.pass),
        builder: (context, model) {

          //List of children to filled
          List<Widget> children;

          //If no current pass, display status and new pass button
          if (model.content == null) {
            children = [

              PassStatus(),

              ElevatedButton(

                //Opens a pass form dialog
                onPressed: () {
                  showDialog(context: context, builder: (context) => Dialog(
                    backgroundColor: Theme.of(context).cardTheme.color,
                    child: Padding(
                      padding: EdgeInsets.all(10),

                      child: PassForm(

                        //Closes dialog and dispatches open pass action
                        onSubmit: (pass) {
                          Navigator.of(context).pop();
                          model.dispatch(PassAction.open(pass));
                        },

                        //Closes dialog
                        onCancel: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ));
                },

                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("New Pass"),
                ),
              ),

            ];
          }

          //Otherwise, display status and close and update buttons
          else {
            children = [

              PassStatus(),

              Row(
                children: [

                  Expanded(
                    flex: 10,
                    child: ElevatedButton(

                      //Opens a pass form dialog with existing pass data
                      onPressed: () {
                        showDialog(context: context, builder: (context) => Dialog(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: PassForm(

                              //Passes existing data
                              existing: model.content,

                              //Closes dialog and dispatches update pass action
                              onSubmit: (pass) {
                                Navigator.of(context).pop();
                                model.dispatch(PassAction.update(pass));
                              },

                              //Closes dialog
                              onCancel: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Update Pass"),
                      ),
                    ),
                  ),

                  Spacer(flex: 1,),

                  Expanded(
                    flex: 10,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                      ),

                      //Dispatches close pass action
                      onPressed: () {
                        model.dispatch(PassAction.close());
                      },

                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Close Pass"),
                      ),
                    ),
                  ),

                ],
              ),
            ];
          }

          //Returns page widget containing given children
          return PageWidget(
            title: title,
            children: children,
          );
        }
    );
  }
}