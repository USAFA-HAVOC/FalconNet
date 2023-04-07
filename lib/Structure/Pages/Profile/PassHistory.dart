import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/InfoBar.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

import '../../../Utility/TemporalFormatting.dart';
import '../../Components/PaddedColumn.dart';

///Tab for pass history
///Populated by PassRecord for all previous passes used
class PassHistory extends StatelessWidget {
  const PassHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<List<CadetPass>>>(
        converter: (store) => ViewModel<List<CadetPass>>(store: store, content: store.state.history.history.toList()),
        builder: (context, model) {

          var mutable = model.content;
          mutable.sort((a, b) => b.start_time.compareTo(a.start_time));

          //Generate list view dynamically as list is scrolled with builder constructor
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: model.content.length,
            itemBuilder: (context, index) => PassRecord(pass: mutable[index]),
          );
        }
    );
  }
}

class PassRecord extends StatelessWidget {
  final CadetPass pass;

  const PassRecord({super.key, required this.pass});

  String formatType(String type) {
    switch (type) {
      case "discretionary": return "Discretionary";
      case "weekend": return "Weekend Sign-Out Period";
      case "weekday": return "Weekday Sign-Out Period";
      case "sca": return "SCA";
      case "esss": return "eSSS";
      default: return type;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InfoBar(
      exteriorPadding: const EdgeInsets.symmetric(vertical: 5),
      children: [

        //Displays date range as stacked column
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  describeDate(pass.start_time),
                  style: Theme.of(context).textTheme.bodyMedium
              ),

              Text(
                  "-",
                  style: Theme.of(context).textTheme.bodyMedium
              ),

              Text(
                  describeDate(pass.end_time),
                  style: Theme.of(context).textTheme.bodyMedium
              ),
            ],
          ),
        ),

        const Spacer(flex: 1,),

        //Displays pass type, description, and location in stacked column
        Expanded(
          flex: 10,
          child: PaddedColumn(
            padding: const EdgeInsets.symmetric(vertical: 2),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  formatType(pass.pass_type),
                  style: Theme.of(context).textTheme.bodySmall
              ),

              Text(
                  (pass.sca_number == null ? "" : "SCA: ${pass.sca_number!}. ") + pass.description,
                  style: Theme.of(context).textTheme.bodyMedium
              ),
            ],
          ),
        ),
      ],
    );
  }
}