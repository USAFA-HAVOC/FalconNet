import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/PassAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:flutter/material.dart';

import '../../Model/Database/User.dart';
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
    return StoreConnector<GlobalState, ViewModel<User>>(
        converter: (store) => ViewModel<User>(
            store: store,
            content: store.state.user
        ),
        builder: (context, model) {
          //List of children to filled
          List<Widget> children;

          if (
            !(model.content.accountability?.effective_pass_status ?? true) ||
            !(model.content.accountability?.current_leave?.departure_time.isAfter(DateTime.now()) ?? true)
          ) {
            children = const [
              PassStatus()
            ];
          }

          //If no current pass, display status and new pass button
          else if (model.content.accountability?.current_pass == null) {
            children = [
              const PassStatus(),

              ElevatedButton(
                //Opens a pass form dialog
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      insetPadding: const EdgeInsets.all(20),
                      backgroundColor: Theme.of(context).cardTheme.color,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: PassForm(
                          accountability: model.content.accountability!,

                          //Closes dialog and dispatches open pass action
                          onSubmit: (pass) {
                            Navigator.of(context).pop();
                            model.dispatch(PassAction.open(
                              pass,
                              onFail: () {
                                messenger.showSnackBar(const SnackBar(
                                    content: Text("Unable to Open Pass")));
                              },
                              onSucceed: () {
                                messenger.showSnackBar(const SnackBar(
                                    content: Text("Pass Opened Successfully")));
                              },
                            ));
                          },

                          //Closes dialog
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  );
                },

                style: Theme.of(context).elevatedButtonTheme.style,

                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "New Pass",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ];
          }

          //Otherwise, display status and close and update buttons
          else {
            children = [
              const PassStatus(),

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
                                padding: const EdgeInsets.all(10),
                                child: PassForm(
                                  accountability: model.content.accountability!,

                                  //Passes existing data
                                  editing: model.content.accountability!.current_pass,

                                  //Closes dialog and dispatches update pass action
                                  onSubmit: (pass) {
                                    Navigator.of(context).pop();
                                    model.dispatch(PassAction.update(
                                      pass,
                                      onFail: () {
                                        messenger.showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Unable to Update Pass"
                                            ),
                                          ),
                                        );
                                      },
                                      onSucceed: () {
                                        messenger.showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Pass Updated Successfully"
                                            ),
                                          ),
                                        );
                                      },
                                    ));
                                  },

                                  //Closes dialog
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            )
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Update",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 10,
                    child: ElevatedButton(
                      style: Theme.of(context).extension<NegativeButtonTheme>()!.style,

                      //Dispatches close pass action
                      onPressed: () {
                        model.dispatch(PassAction.close(
                          onFail: () {
                            messenger.showSnackBar(
                              const SnackBar(
                                content: Text("Unable to Close Pass"),
                              ),
                            );
                          },
                          onSucceed: () {
                            messenger.showSnackBar(
                              const SnackBar(
                                content: Text("Pass Closed Successfully"),
                              ),
                            );
                          },
                        ));
                      },

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Close",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
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
