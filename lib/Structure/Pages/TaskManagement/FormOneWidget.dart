import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/FormAction.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

import '../../../Model/Data/FormOne.dart';
import '../../../Model/Store/GlobalState.dart';

///Page Widget for signing a form one
///Displayed in task center
///Displays form one title, description, and a signing button
///Will display a confirmation dialog on attempted signing
class FormOneWidget extends StatelessWidget {
  final FormOne form;

  const FormOneWidget({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: PageWidget(
        title: form.title,
        children: [
          Text(
            form.description,
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
                        model.dispatch(FormAction(form));
                      },
                    ),
                  );
                },

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Sign"),
                ),
              )
          )
        ],
      ),
    );
  }
}