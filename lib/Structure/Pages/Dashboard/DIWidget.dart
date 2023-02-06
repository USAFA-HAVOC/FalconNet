import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetDI.dart';
import 'package:falcon_net/Model/Store/Actions/SignAction.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

class DITuple {
  final CadetDI? di;
  final List<String> roles;

  const DITuple({required this.di, required this.roles});
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
            ViewModel<DITuple>(store: store, content: DITuple(di: store.state.user.di, roles: store.state.user.roles.toList())),
        builder: (context, model) {

          //Whether cadet is able to sign own di based on roles
          bool senior = model.content.roles.any((role) => role == "sign_own_di");

          //Determines whether time is signable
          bool time = DateTime.now().toUtc().isAfter(combineDate(DateTime.now().toUtc(), TimeOfDay(hour: 19, minute: 50)));

          //Whether cadet has already signed
          bool signed = model.content.di != null;

          bool signable = !signed && senior && time;

          //Determine text based on state values
          List<Widget> text;
          if (signable) {
            text = [Text(
              "DI is Open",
              style: Theme.of(context).textTheme.headlineMedium,
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
          else if (!time) {
            text = [Text(
              "DI Opens at 19:50",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.black,
              ),
            )];
          }
          else {
            text = [Text(
              "DI Signed by ${model.content.di!.signed_by}",
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