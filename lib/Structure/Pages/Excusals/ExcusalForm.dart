import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Excusal.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/AccountabilityEvent.dart';

class ExcusalForm extends StatefulWidget {
  final EventExcusal? excusal;
  final void Function(EventExcusal) onSubmit;
  final void Function() onCancel;

  const ExcusalForm(
      {super.key,
      required this.excusal,
      required this.onSubmit,
      required this.onCancel});

  @override
  State<StatefulWidget> createState() => ExcusalFormState();
}

class ExcusalFormState extends State<ExcusalForm> {
  final key = GlobalKey<FormState>();

  late String type;
  late TextEditingController secondary;
  String? event;

  @override
  void initState() {
    super.initState();
    type = widget.excusal?.excusal.type ?? ExcusalType.sca.name;
    secondary = TextEditingController(
        text: widget.excusal?.excusal.sca_number ??
            widget.excusal?.excusal.other_description);
    event = widget.excusal?.event_id;
  }

  void attemptSubmit(String user) {
    if (key.currentState?.validate() ?? false) {
      widget.onSubmit((EventExcusalBuilder()
            ..event_id = event
            ..excusal = (ExcusalBuilder()
              ..type = type
              ..other_description =
                  (type == ExcusalType.other.name) ? secondary.text : null
              ..sca_number =
                  (type == ExcusalType.sca.name) ? secondary.text : null)
            ..id = widget.excusal?.id
            ..user_id = user)
          .build());
    }
  }

  @override
  Widget build(BuildContext context) =>
      StoreConnector<GlobalState, ViewModel<GlobalState>>(
        converter: (store) => ViewModel(store: store, content: store.state),
        builder: (context, model) {
          return Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String?>(
                    value: type,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Excusal Type"),
                    items: ExcusalType.values
                        .map((v) => DropdownMenuItem(
                            value: v.name, child: Text(v.display())))
                        .toList(),
                    validator: InputValidation.dropdown(),
                    onChanged: (change) =>
                        setState(() => type = change ?? type)),
                if (type == ExcusalType.sca.name)
                  TextFormField(
                    controller: secondary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "SCA Number"),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: InputValidation.stringLength(
                        emptyMessage: "Please enter an SCA Number"),
                  ),
                if (type == ExcusalType.other.name)
                  TextFormField(
                    controller: secondary,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Other Description"),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: InputValidation.stringLength(
                        emptyMessage: "Please enter a description"),
                  ),
                DropdownButtonFormField<String?>(
                  value: event,
                  items: model.content.events
                          .toList()
                          .where((e) => e.type != EventType.di.name)
                          .where((e) =>
                              e.submission_deadline.isAfter(DateTime.now()))
                          .toList()
                          .sortedKey((e) => e.time)
                          .map((e) => DropdownMenuItem(
                              value: e.event_id,
                              child: Text(
                                  "${e.name ?? "No Description"} ${describeDate(e.time.toLocal(), true)}")))
                          .toList() +
                      const [
                        DropdownMenuItem(value: null, child: Text("Select"))
                      ],
                  onChanged: (change) => setState(() => event = change),
                  validator: InputValidation.dropdown(),
                  decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      labelText: "Event"),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => attemptSubmit(model.content.user.id!),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Submit",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xffe8e8e8),
                          ),
                        ),
                        onPressed: widget.onCancel,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Cancel",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      );
}
