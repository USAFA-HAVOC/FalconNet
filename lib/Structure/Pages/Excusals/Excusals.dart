import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Excusal.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/FNPage.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:flutter/material.dart';

import '../../Components/ViewModel.dart';

class Excusals extends StatelessWidget {
  const Excusals({super.key});

  @override
  Widget build(BuildContext context) => StoreConnector<GlobalState, ViewModel<List<Excusal>>>(
      converter: (store) => ViewModel(store: store, content: []),
      builder: (context, model) => FNPage(
          title: "Excusals",
          children: [
            PageWidget(
                title: "Daily Excusals",
                children: [


                ]
            ),

            PageWidget(
                title: "Recurring Excusals",
                children: [

                ]
            )
          ]
      ),
  );
}