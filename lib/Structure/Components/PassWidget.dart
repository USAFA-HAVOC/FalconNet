import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/Actions/PassAction.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

import 'PassStatus.dart';
import 'PassForm.dart';

///Page Widget for displaying current pass status and pass management ui
class PassWidget extends StatelessWidget {
  //Title of widget, defaults to "Pass Management"
  final String title;

  const PassWidget({super.key, this.title = "Pass Management"});

  @override
  Widget build(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    return StoreConnector<GlobalState, ViewModel<CadetPass?>>(
        converter: (store) => ViewModel<CadetPass?>(
            store: store,
            content: store.state.user.accountability?.current_pass),
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
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            backgroundColor: Theme.of(context).cardTheme.color,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: PassForm(
                                //Closes dialog and dispatches open pass action
                                onSubmit: (pass) {
                                  Navigator.of(context).pop();
                                  model.dispatch(PassAction.open(
                                    pass,
                                    onFail: () {
                                      messenger.showSnackBar(const SnackBar(
                                          content:
                                              Text("Unable to Open Pass")));
                                    },
                                    onSucceed: () {
                                      messenger.showSnackBar(const SnackBar(
                                          content: Text(
                                              "Pass Opened Successfully")));
                                    },
                                  ));
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
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: PassForm(
                                      //Passes existing data
                                      editing: model.content,

                                      //Closes dialog and dispatches update pass action
                                      onSubmit: (pass) {
                                        Navigator.of(context).pop();
                                        model.dispatch(PassAction.update(
                                          pass,
                                          onFail: () {
                                            messenger.showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Unable to Update Pass")));
                                          },
                                          onSucceed: () {
                                            messenger.showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Pass Updated Successfully")));
                                          },
                                        ));
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
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 10,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey),
                      ),

                      //Dispatches close pass action
                      onPressed: () {
                        model.dispatch(PassAction.close(
                          onFail: () {
                            messenger.showSnackBar(const SnackBar(
                                content: Text("Unable to Close Pass")));
                          },
                          onSucceed: () {
                            messenger.showSnackBar(const SnackBar(
                                content: Text("Pass Closed Successfully")));
                          },
                        ));
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
        });
  }
}
