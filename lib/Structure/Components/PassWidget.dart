import 'package:falcon_net/Model/Data/Pass.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/Store/GlobalState.dart';
import '../../Model/Store/StateAction.dart';
import 'PaddedColumn.dart';
import 'PassStatus.dart';
import 'PassForm.dart';

class PassWidget extends StatelessWidget {
  final String title;

  const PassWidget({super.key, this.title="Pass Management"});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          List<Widget> children;
          if (store.state.pass == null) {
            children = [
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
            ];
          }
          else {
            children = [
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
            ];
          }
          return PageWidget(
            title: title,
            children: children,
          );
        }
    );
  }
}