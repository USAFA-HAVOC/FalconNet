import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';
import 'package:falcon_net/Model/Database/UserEvent.dart';
import 'package:falcon_net/Model/Store/Actions/SignAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

///Page Widget for signing a form one
///Displayed in task center
///Displays form one title, description, and a signing button
///Will display a confirmation dialog on attempted signing
class FormOneWidget extends StatelessWidget {
  final UserEvent form;

  const FormOneWidget({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: form.name,
      children: [
        Text(
          form.description ?? "No description given",
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        StoreConnector<GlobalState, ViewModel<void>>(
            converter: (store) => ViewModel<void>(store: store, content: null),
            builder: (context, model) => ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ConfirmationDialog(
                    title: "Confirm Signing",
                    description: "Please confirm that you have read and understand this Form 1. "
                        "This action cannot be reversed.",

                    //Dispatches signing action with own form one
                    onConfirm: () {
                      model.dispatch(SignAction(
                        event: form.event_id,
                        onSucceed: () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Successfully Signed Form"))
                        ),
                        onFail: () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Failed to Sign Form"))
                        )
                      ));
                    },
                  ),
                );
              },

              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Sign",
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ),
            )
        )
      ],
    );
  }
}