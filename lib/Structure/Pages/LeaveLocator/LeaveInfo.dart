import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/LeaveDescription.dart';
import 'package:flutter/material.dart';

import '../../../Model/Store/Actions/LeaveAction.dart';
import '../../../Theme/NegativeButtonTheme.dart';
import '../../Components/ViewModel.dart';
import 'LeaveLocatorForm.dart';

///Displays leave information and allows user to clear or update
class LeaveInfo extends StatelessWidget {
  const LeaveInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    return StoreConnector<GlobalState, ViewModel<CadetLeave?>>(
        converter: (store) => ViewModel(store: store, content: store.state.user.accountability!.current_leave?.toLocal()),
        builder: (context, model) {
          CadetLeave leave = model.content!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeaveDescription(leave: leave),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(

                          //When pressed, display leave form in dialog with existing data
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                    child: ListView(
                                      primary: false,
                                      shrinkWrap: true,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: LeaveLocatorForm(
                                            editing: leave,
                                            dialog: true,
                                          ),
                                        )
                                      ],
                                    )
                                )
                            );
                          },

                          child: Text(
                            'Edit Leave',
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ),
                      )
                  ),

                  const Spacer(flex: 1),

                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: Theme.of(context).extension<NegativeButtonTheme>()!.style,

                      //Dispatch a clear leave action
                      onPressed: () {
                        model.dispatch(LeaveAction.clear(
                            onSucceed: () {
                              messenger.showSnackBar(const SnackBar(content: Text("Leave Data Cleared Successfully")));
                            },
                            onFail: () {
                              messenger.showSnackBar(const SnackBar(content: Text("Failed to Clear Leave Data")));
                            }
                        ));
                      },

                      child: Text(
                        'Clear Data',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}