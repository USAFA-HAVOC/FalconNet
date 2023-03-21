import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Store/Actions/SignAction.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Services/SchedulingService.dart';
import 'package:falcon_net/Structure/Components/ConfirmationDialog.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/Roles.dart';
import '../../../Utility/FNConstants.dart';

class DITuple {
  final CadetAccountability? accountability;
  final List<String> roles;

  const DITuple({required this.accountability, required this.roles});
}

///Page widget for displaying DI information with signing ui
class DIWidget extends StatelessWidget {
  final String title;

  const DIWidget({super.key, this.title = "Dormitory Inspection"});

  @override
  Widget build(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    return StoreConnector<GlobalState, ViewModel<DITuple>>(
        converter: (store) => ViewModel<DITuple>(
            store: store,
            content: DITuple(
                accountability: store.state.user.accountability,
                roles: store.state.user.roles.map((r) => r.role).toList())),
        builder: (context, model) => ScheduledBuilder(
          id: "di",
          builder: (context, payload) {
            //Whether cadet is able to sign own di based on roles
            bool senior = model.content.roles.any((role) => role == Roles.signable.name);

            //Determines whether time is signable
            bool time = !DateTime.now().isBefore(combineDate(DateTime.now(), diOpens));

            if (!time) {
              SchedulingService().schedule(id: "di", time: combineDate(DateTime.now(), diOpens), payload: "opened");
            }

            //Whether cadet has already signed
            bool signed = false;
            if (model.content.accountability?.di_last_signed != null) {
              var signature =
              model.content.accountability!.di_last_signed!.toLocal();
              var present = DateTime.now().toLocal();
              if (signature.year == present.year &&
                  signature.month == present.month &&
                  signature.day == present.day) {
                signed = true;
              }
            }

            bool signable = !signed && senior && time;

            //Determine text based on state values
            List<Widget> text;
            if (signable) {
              text = [
                Text(
                  "DI is Open",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ];
            } else if (signed) {
              text = [
                Text(
                  "DI Signed by ${model.content.accountability!.di_signed_name ?? "Himothy"}",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ];
            } else if (!senior) {
              text = [
                Text(
                  "Cannot Sign Own DI",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ];
            } else {
              text = [
                Text(
                  "DI Opens at ${diOpens.hour}:${diOpens.minute}",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ];
            }

            //Sets content to card with info text
            List<Widget> content = [
              Card(
                  color: signable
                      ? Theme.of(context).focusColor
                      : Theme.of(context).focusColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: text,
                    ),
                  )),
            ];

            //If signable, add button to sign di
            if (signable) {
              content.add(
                ElevatedButton(
                  //Dispatch sign di action
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: "Sign DI",
                          description: "Confirm that you are at the location of your domicile. "
                              "This action cannot be undone.",
                          onConfirm: () => model.dispatch(SignAction(
                              onSucceed: () => messenger.showSnackBar(
                                  const SnackBar(content: Text("DI Signed Successfully"))
                              ),
                              onFail: () => messenger.showSnackBar(
                                  const SnackBar(content: Text("Failed to Sign DI"))
                              )
                          ))
                      )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Sign',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              );
            }

            //Return Page Widget with given content
            return PageWidget(title: title, children: content);
          }
        )
    );
  }
}
