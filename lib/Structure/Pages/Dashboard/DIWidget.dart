import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Store/Actions/SignAction.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/Roles.dart';

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
        converter: (store) =>
            ViewModel<DITuple>(
                store: store,
                content: DITuple(
                    accountability: store.state.user.accountability,
                    roles: store.state.user.roles.map((r) => r.role).toList()
                )
            ),
        builder: (context, model) {

          //Whether cadet is able to sign own di based on roles
          bool senior = model.content.roles.any((role) => role == Roles.signable.name);

          //Determines whether time is signable
          bool time = DateTime.now().isAfter(combineDate(DateTime.now(), TimeOfDay(hour: 19, minute: 15)));

          //Whether cadet has already signed
          bool signed = false;
          if (model.content.accountability?.di_last_signed != null) {
            var signature = model.content.accountability!.di_last_signed!.toLocal();
            print(signature);
            var present = DateTime.now().toLocal();
            if (signature.year == present.year && signature.month == present.month && signature.day == present.day) {
              signed = true;
            }
          }

          bool signable = !signed && senior && time;

          //Determine text based on state values
          List<Widget> text;
          if (signable) {
            text = [Text(
              "DI is Open",
              style: Theme.of(context).textTheme.headlineMedium,
            )];
          }
          else if (signed) {
            text = [Text(
              "DI Signed by ${model.content.accountability!.di_signed_name ?? "Himothy"}",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }
          else if (!senior) {
            text = [Text(
              "Cannot Sign Own DI",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }
          else {
            text = [Text(
              "DI Opens at 19:50",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }

          //Sets content to card with info text
          List<Widget> content = [
            Card(
                color: signable ? Theme.of(context).focusColor : Theme.of(context).canvasColor,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: text,
                  ),
                )
            ),
          ];

          //If signable, add button to sign di
          if (signable) {
            content.add(
              ElevatedButton(

                //Dispatch sign di action
                onPressed: () {
                  model.dispatch(SignAction(
                    onSucceed: () {
                      messenger.showSnackBar(const SnackBar(content: Text("DI Signed Successfully")));
                    },
                    onFail: () {
                      messenger.showSnackBar(const SnackBar(content: Text("Failed to Sign DI")));
                    }
                  ));
                },

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: const Text('Sign'),
                ),
              ),
            );
          }

          //Return Page Widget with given content
          return PageWidget(
              title: title,
              children: content
          );
        }
    );
  }
}