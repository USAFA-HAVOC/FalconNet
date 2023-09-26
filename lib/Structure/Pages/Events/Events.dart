import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UserEvent.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Pages/Events/Schedule.dart';
import 'package:falcon_net/Structure/Pages/Events/Signatures.dart';
import 'package:flutter/material.dart';

import '../../Components/ViewModel.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) =>
      StoreConnector<GlobalState, ViewModel<List<UserEvent>>>(
        converter: (store) =>
            ViewModel(store: store, content: store.state.events.toList()),
        builder: (context, model) => FNPage(
          title: "Events",
          children: [
            Schedule(events: model.content),
            Signatures(events: model.content)
          ],
        ),
      );
}
