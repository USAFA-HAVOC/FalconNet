import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/Store/GlobalState.dart';
import '../../Model/Store/StateAction.dart';
import 'PassStatus.dart';
import 'PassForm.dart';

///Page Widget for displaying current pass status and pass management ui
class PassWidget extends StatelessWidget {

  //Title of widget, defaults to "Pass Management"
  final String title;

  const PassWidget({super.key, this.title="Pass Management"});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {

          //List of children to filled
          List<Widget> children;

          //If no current pass, display status and new pass button
          if (store.state.pass == null) {
            children = [

              PassStatus(),

              ElevatedButton(

                //Opens a pass form dialog
                onPressed: () {
                  showDialog(context: context, builder: (context) => Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(10),

                      child: PassForm(

                        //Closes dialog and dispatches open pass action
                        onSubmit: (pass) {
                          Navigator.of(context).pop();
                          store.dispatch(StateAction.openPass(pass));
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
                              existing: store.state.pass,

                              //Closes dialog and dispatches update pass action
                              onSubmit: (pass) {
                                Navigator.of(context).pop();
                                store.dispatch(StateAction.updatePass(pass));
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
                        store.dispatch(StateAction.closePass());
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