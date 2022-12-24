import 'package:falcon_net/Model/Pass.dart';
import 'package:falcon_net/Model/StateAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';
import '../../Shared/PaddedColumn.dart';
import 'PassStatus.dart';
import 'PassForm.dart';

class PassManagement extends StatelessWidget {
  const PassManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: PaddedColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        padding: EdgeInsets.all(10),
        children: [
          Text(
              "Pass Management",
              style: Theme.of(context).textTheme.titleMedium
          ),
          StoreBuilder<GlobalState>(
              builder: (context, store) {
                if (store.state.pass == null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PassStatus(),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(context: context, builder: (context) => Dialog(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: PassForm(
                                onSubmit: (pass) {
                                  Navigator.of(context).pop();
                                  store.dispatch(StateAction.openPass(pass));
                                },
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
                      )
                    ],
                  );
                }
                else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PassStatus(),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(context: context, builder: (context) => Dialog(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: PassForm(
                                      existing: store.state.pass,
                                      onSubmit: (pass) {
                                        Navigator.of(context).pop();
                                        store.dispatch(StateAction.updatePass(pass));
                                        print("Attempt update");
                                      },
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
                    ],
                  );
                }
              }
          ),

        ],
      ),
    );
  }
}