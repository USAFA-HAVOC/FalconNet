import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Signing/UnitSigningEvent.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/AccountabilityEvent.dart';
import '../../../../../Model/Database/UserEvent.dart';
import '../../../../../Model/Store/Endpoints.dart';
import '../../../../Components/ViewModel.dart';

class SDOTask extends StatelessWidget {
  const SDOTask({super.key});

  @override
  Widget build(BuildContext context) => StoreConnector<GlobalState, ViewModel<List<UserEvent>>>(
      converter: (store) =>
          ViewModel(store: store, content: store.state.events.toList()),
      builder: (context, model) {
        return UnitSigningEvent(
          retrieve: () => Endpoints.getUnit(UnitDataRequest.direct()),
          refresh: 10,
          label: "SDO",
          statusLabel: "Inspections",
          event: null,
          excusable: false,
        );
      }
  );
}