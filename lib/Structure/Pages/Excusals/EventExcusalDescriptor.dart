import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/AccountabilityEvent.dart';
import '../../../Model/Database/Excusal.dart';
import '../../../Model/Database/UserEvent.dart';
import '../../../Model/Store/GlobalState.dart';
import '../../Components/InfoBar.dart';
import '../../Components/ViewModel.dart';

class EventExcusalDescriptor extends StatelessWidget {
  final EventExcusal excusal;
  final void Function() onEdit;
  final void Function() onDelete;

  static const List<String> days = ["M", "Tu", "W", "Th", "F", "Sa", "Su"];

  const EventExcusalDescriptor({
    super.key,
    required this.excusal,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) => StoreConnector<GlobalState, ViewModel<List<UserEvent>>>(
      converter: (store) => ViewModel(store: store, content: store.state.events.toList()),
      builder: (context, model) {
        UserEvent event = model.content.firstWhere((e) => e.event_id == excusal.event_id);
        ExcusalType type = ExcusalTypeNames.parse(excusal.excusal.type);
        String typeDesc = switch (type) {
          ExcusalType.other => excusal.excusal.other_description,
          ExcusalType.sca => "SCA: ${excusal.excusal.sca_number}",
          ExcusalType.bedrest || ExcusalType.ic_status || ExcusalType.los || ExcusalType.gr => type.display()
        }!;

        return InfoBar(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      typeDesc,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    Text(
                      "${event.name ?? "DI"} ${describeDate(event.time.toLocal(), true)}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),

                    Text(
                      EventTypeNames.parse(event.type).describe(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
            ),

            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                )
            ),

            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                )
            ),
          ],
        );
      }
  );
}