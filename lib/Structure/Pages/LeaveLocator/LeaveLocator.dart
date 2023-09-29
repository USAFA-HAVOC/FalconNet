import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';
import '../../Components/PageWidget.dart';
import 'LeaveInfo.dart';
import 'LeaveLocatorForm.dart';

///Leave locator page which displays either leave locator form or information
class LeaveLocator extends StatelessWidget {
  const LeaveLocator({super.key});

  //Filled out leave data for testing purposes
  final CadetLeave? test = null;

  @override
  Widget build(BuildContext context) {
    return FNPage(
      title: "Leave Locator",
      children: [
        PageWidget(
          title: 'Locator form',
          //Displays form or existing data depending on state
          children: [
            StoreConnector<GlobalState, ViewModel<CadetLeave?>>(
              converter: (store) => ViewModel<CadetLeave?>(
                  store: store,
                  content: store.state.user.accountability?.current_leave),
              builder: (context, model) {
                if (model.content == null) {
                  return LeaveLocatorForm(dialog: false, editing: test);
                } else {
                  return const LeaveInfo();
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
