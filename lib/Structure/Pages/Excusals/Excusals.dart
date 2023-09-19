import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Excusal.dart';
import 'package:falcon_net/Model/Store/Actions/ExcusalAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/Excusals/ExcusalForm.dart';
import 'package:falcon_net/Structure/Pages/Excusals/ExcusalList.dart';
import 'package:falcon_net/Structure/Pages/Excusals/RecurringExcusalDescriptor.dart';
import 'package:falcon_net/Structure/Pages/Excusals/RecurringForm.dart';
import 'package:flutter/material.dart';

import '../../Components/ViewModel.dart';
import 'EventExcusalDescriptor.dart';

class Excusals extends StatelessWidget {
  const Excusals({super.key});

  static successMessage(BuildContext context, String verb) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Successfully ${verb}d excusal"))
    );
  }

  static failureMessage(BuildContext context, String verb) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to $verb excusal"))
    );
  }

  static openExcusalDialog(BuildContext context, EventExcusal? excusal, void Function(EventExcusal) onSubmit) => showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ExcusalForm(
            excusal: excusal,
            onSubmit: (excusal) {
              Navigator.pop(context);
              onSubmit(excusal);
            },
            onCancel: () => Navigator.pop(context),
          ),
        )
      )
  );

  static openRecurringDialog(BuildContext context, RecurringExcusal? recurring, void Function(RecurringExcusal) onSubmit) => showDialog(
      context: context,
      builder: (context) => Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: RecurringForm(
              excusal: recurring,
              onSubmit: (excusal) {
                Navigator.pop(context);
                onSubmit(excusal);
              },
              onCancel: () => Navigator.pop(context),
            ),
          )
      )
  );

  @override
  Widget build(BuildContext context) => StoreConnector<GlobalState, ViewModel<GlobalState>>(
      converter: (store) => ViewModel(store: store, content: store.state),
      builder: (context, model) => FNPage(
          title: "Excusals",
          children: [
            PageWidget(
                title: "Daily Excusals",
                children: [
                  ExcusalList<EventExcusal>(
                    excusals: model.content.excusals
                        .where((e) =>
                            model.content.events.firstWhere((ev) => ev.event_id == e.event_id)
                                .submission_deadline.isAfter(DateTime.now())
                        ).toList(),
                    add: (excusal) => model.dispatch(ExcusalAction.createExcusal(excusal: excusal)),
                    converter: (excusal) => EventExcusalDescriptor(
                      excusal: excusal,
                      onEdit: () => openExcusalDialog(
                        context,
                        excusal,
                        (excusal) => model.dispatch(ExcusalAction.createExcusal(excusal: excusal,))
                      ),
                      onDelete: () => model.dispatch(ExcusalAction.deleteExcusal(excusal: excusal)),
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () => openExcusalDialog(
                          context,
                          null,
                          (excusal) => model.dispatch(ExcusalAction.createExcusal(excusal: excusal,))
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                  ),
                ]
            ),

            PageWidget(
                title: "Recurring Excusals",
                children: [
                  ExcusalList<RecurringExcusal>(
                    excusals: model.content.recurring.toList(),
                    add: (excusal) => model.dispatch(ExcusalAction.createRecurring(recurring: excusal,)),
                    converter: (excusal) => RecurringExcusalDescriptor(
                        excusal: excusal,
                        onEdit: () => openRecurringDialog(
                            context,
                            excusal,
                            (excusal) => model.dispatch(ExcusalAction.createRecurring(recurring: excusal,))
                        ),
                        onDelete: () => model.dispatch(ExcusalAction.deleteRecurring(recurring: excusal,)),
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () => openRecurringDialog(
                          context,
                          null,
                          (excusal) => model.dispatch(ExcusalAction.createRecurring(recurring: excusal))
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                  ),
                ]
            )
          ]
      )
  );
}