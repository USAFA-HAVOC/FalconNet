import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Excusal.dart';
import 'package:falcon_net/Model/Store/Actions/ExcusalAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/Excusals/ExcusalList.dart';
import 'package:falcon_net/Structure/Pages/Excusals/RecurringExcusalDescriptor.dart';
import 'package:flutter/material.dart';

import '../../Components/ViewModel.dart';
import 'EventExcusalDescriptor.dart';

class Excusals extends StatelessWidget {
  const Excusals({super.key});

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
                    excusals: model.content.excusals.toList(),
                    add: (excusal) => model.dispatch(ExcusalAction.createExcusal(excusal: excusal)),
                    converter: (excusal) => EventExcusalDescriptor(
                      excusal: excusal,
                      onEdit: () {},
                      onDelete: () => model.dispatch(ExcusalAction.deleteExcusal(excusal: excusal)),
                    ),
                  )
                ]
            ),

            PageWidget(
                title: "Recurring Excusals",
                children: [
                  ExcusalList<RecurringExcusal>(
                    excusals: model.content.recurring.toList(),
                    add: (excusal) => model.dispatch(ExcusalAction.createRecurring(recurring: excusal)),
                    converter: (excusal) => RecurringExcusalDescriptor(
                        excusal: excusal,
                        onEdit: () {},
                        onDelete: () => model.dispatch(ExcusalAction.deleteRecurring(recurring: excusal)),
                    ),
                  )
                ]
            )
          ]
      )
  );
}