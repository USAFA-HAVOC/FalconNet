import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../Model/Store/GlobalState.dart';
import '../../../Model/Data/Pass.dart';
import '../../../Utility/TemporalFormatting.dart';
import '../../Components/PaddedColumn.dart';

///Tab for pass history
///Populated by PassRecord for all previous passes used
class PassHistory extends StatelessWidget {
  const PassHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {

          //Generate list view dynamically as list is scrolled with builder constructor
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: store.state.history.length,
            itemBuilder: (context, index) => PassRecord(pass: store.state.history[index]),
          );
        }
    );
  }
}

class PassRecord extends StatelessWidget {
  final Pass pass;

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
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).dividerColor
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [

              //Displays date range as stacked column
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        pass.start != null ? describeDate(pass.start!) : "None",
                        style: Theme.of(context).textTheme.bodyMedium
                    ),

                    Text(
                        "-",
                        style: Theme.of(context).textTheme.bodyMedium
                    ),

                    Text(
                        pass.end != null ? describeDate(pass.end!) : "Open",
                        style: Theme.of(context).textTheme.bodyMedium
                    ),
                  ],
                ),
              ),

              Spacer(flex: 1,),

              //Displays pass type, description, and location in stacked column
              Expanded(
                flex: 10,
                child: PaddedColumn(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        pass.type == null ? "No Type" : formatType(pass.type!),
                        style: Theme.of(context).textTheme.bodySmall
                    ),

                    Text(
                        (pass.sca == null ? "" : "SCA: ${pass.sca!}. ") + (pass.description ?? "No description."),
                        style: Theme.of(context).textTheme.bodyMedium
                    ),

                    Text(
                        "${pass.city ?? "None"}, ${pass.state ?? "None"} ${pass.zip ?? ""}",
                        style: Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}