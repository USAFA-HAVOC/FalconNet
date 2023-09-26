import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/Excusal.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Theme/NegativeButtonTheme.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:flutter/material.dart';

import '../../../Model/Database/AccountabilityEvent.dart';

class RecurringForm extends StatefulWidget {
  final RecurringExcusal? excusal;

  final void Function(RecurringExcusal) onSubmit;
  final void Function() onCancel;

  const RecurringForm({
    super.key,
    required this.excusal,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<StatefulWidget> createState() => RecurringFormState();
}

class RecurringFormState extends State<RecurringForm> {
  final key = GlobalKey<FormState>();

  late String type;
  late TextEditingController secondary;
  late Map<String, bool> events;
  late String? time;
  late List<bool> days;

  static const List<String> dayLiterals = [
    "M",
    "Tu",
    "W",
    "Th",
    "F",
    "Sa",
    "Su"
  ];

  @override
  void initState() {
    super.initState();
    type = widget.excusal?.excusal.type ?? ExcusalType.sca.name;
    secondary = TextEditingController(
        text: widget.excusal?.excusal.sca_number ??
            widget.excusal?.excusal.other_description);
    events = Map.fromEntries(EventType.values.map((v) => MapEntry(
        v.name, widget.excusal?.event_types.contains(v.name) ?? false)));
    days = widget.excusal?.excused_days?.toList() ?? List.filled(7, false);
    time = widget.excusal?.recurring_excusal_type;
  }

  void attemptSubmit(String user) {
    if (key.currentState?.validate() ?? false) {
      widget.onSubmit((RecurringExcusalBuilder()
            ..excusal = (ExcusalBuilder()
              ..type = type
              ..other_description =
                  (type == ExcusalType.other.name) ? secondary.text : null
              ..sca_number =
                  (type == ExcusalType.sca.name) ? secondary.text : null)
            ..event_types = events.entries
                .where((e) => e.value)
                .map((e) => e.key)
                .toBuiltList()
                .toBuilder()
            ..recurring_excusal_type = time
            ..excused_days = days.toBuiltList().toBuilder()
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
            child: ListView(
              shrinkWrap: true,
              children: [
                DropdownButtonFormField<String?>(
                    value: type,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Excusal Type"),
                    items: ExcusalType.values
                        .map(
                          (v) => DropdownMenuItem(
                            value: v.name,
                            child: Text(v.display()),
                          ),
                        )
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
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: events.entries
                      .map((e) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(EventTypeNames.parse(e.key).describe()),
                              Checkbox(
                                  value: e.value,
                                  onChanged: (state) =>
                                      setState(() => events[e.key] = state!))
                            ],
                          ))
                      .toList(),
                ),
                DropdownButtonFormField<String?>(
                  value: time,
                  items: RecurringExcusalType.values
                          .map((e) => DropdownMenuItem<String?>(
                              value: e.name,
                              child: Text(
                                  RecurringExcusalTypeNames.parse(e.name)
                                      .display())))
                          .toList() +
                      const [
                        DropdownMenuItem<String?>(
                            value: null, child: Text("Select"))
                      ],
                  onChanged: (change) => setState(() => time = change),
                  decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      labelText: "Times"),
                  validator: InputValidation.dropdown(),
                ),
                if (time == RecurringExcusalType.days_of_week.name)
                  GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: days
                        .asMap()
                        .entries
                        .map((e) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(dayLiterals[e.key]),
                                Checkbox(
                                    value: e.value,
                                    onChanged: (state) =>
                                        setState(() => days[e.key] = state!))
                              ],
                            ))
                        .toList(),
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
