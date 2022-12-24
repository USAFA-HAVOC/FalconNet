import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/GlobalState.dart';
import '../../Model/Pass.dart';
import '../../Shared/PaddedColumn.dart';

class PassHistory extends StatelessWidget {
  const PassHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          return ListView(
            primary: false,
            shrinkWrap: true,
            children: store.state.history.map((pass) => PassRecord(pass: pass)).toList(),
          );
        }
    );
  }
}

class PassRecord extends StatelessWidget {
  final Pass pass;

  const PassRecord({super.key, required this.pass});

  String describeDate(DateTime date) {
    return "${date.month}/${date.day} ${date.hour}:${date.minute}";
  }

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
              Spacer(
                flex: 1,
              ),
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