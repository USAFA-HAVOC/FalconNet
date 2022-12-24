import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/StateAction.dart';
import 'package:falcon_net/Pages/LeaveLocator/MethodSubform/LeaveMethodSubform.dart';
import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/Leave.dart';
import '../../Shared/DateFormField.dart';
import '../../Shared/PaddedColumn.dart';
import '../../Shared/TimeFormField.dart';

class LeaveLocatorForm extends StatefulWidget {
  final Leave? existing;
  final bool dialog;
  final void Function()? onSubmit;
  const LeaveLocatorForm({super.key, this.existing, this.dialog = true, this.onSubmit});

  @override
  State<LeaveLocatorForm> createState() => LeaveLocatorFormState();
}

class LeaveLocatorFormState extends State<LeaveLocatorForm> {
  final key = GlobalKey<FormState>();
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController zipController;
  late String state;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController depDateController;
  late TextEditingController depTimeController;
  late TextEditingController retDateController;
  late TextEditingController retTimeController;
  late SubformController<LeaveMethod> depMethodController;
  late SubformController<LeaveMethod> retMethodController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.existing?.finalAddress);
    cityController = TextEditingController(text: widget.existing?.finalCity);
    zipController = TextEditingController(text: widget.existing?.finalZip);
    state = widget.existing?.finalState ?? "Colorado";
    nameController = TextEditingController(text: widget.existing?.contactName);
    phoneController = TextEditingController(text: widget.existing?.contactPhone);
    depDateController = TextEditingController(text: describeDate(widget.existing?.departureTime ?? DateTime.now()));
    depTimeController = TextEditingController(text: describeTime(timeOf(widget.existing?.departureTime ?? DateTime.now())));
    retDateController = TextEditingController(text: describeDate(widget.existing?.returnTime ?? DateTime.now()));
    retTimeController = TextEditingController(text: describeTime(timeOf(widget.existing?.returnTime ?? DateTime.now())));
    depMethodController = SubformController<LeaveMethod>(value: widget.existing?.departureMethod);
    retMethodController = SubformController<LeaveMethod>(value: widget.existing?.returnMethod);
  }

  List<DropdownMenuItem<String>> buildStateOptions() {
    List<String> options = <String>[
      "Alaska", "Alabama", "Arkansas", "Arizona", "California",
      "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia",
      "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas",
      "Kentucky", "Louisiana", "Massachusetts", "Maryland",
      "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi",
      "Montana", "North Carolina", "North Dakota", "Nebraska",
      "New Hampshire", "New Jersey", "New Mexico", "Nevada",
      "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
      "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
      "Texas", "Utah", "Virginia", "Vermont", "Washington", "Wisconsin",
      "West Virginia", "Wyoming", "Select"
    ];

    assert(options.length /*still*/ == 52);

    return options.map((key) => DropdownMenuItem<String>(
        value: key,
        child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge
        )
    )
    ).toList();
  }

  Widget buildSubmissionBar() {
    Widget submit = Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: StoreBuilder<GlobalState>(
            builder: (context, store) {
              return ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    if (widget.dialog) {
                      Navigator.of(context).pop();
                    }
                    store.dispatch(StateAction.setLeave(formatLeave()));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: const Text('Submit'),
                ),
              );
            },
          )
        )
    );
    List<Widget> cancel = [
      Spacer(flex: 1),
      Expanded(
        flex: 5,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: const Text('Cancel'),
          ),
        ),
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.dialog ? [submit] + cancel: [submit],
    );
  }


  Leave formatLeave() {

    return Leave(
        departureMethod: depMethodController.retrieve(),
        returnMethod: retMethodController.retrieve(),
        contactName: nameController.text,
        contactPhone: phoneController.text,
        finalZip: zipController.text,
        finalState: state,
        finalCity: cityController.text,
        finalAddress: addressController.text,
        departureTime: combineDate(parseDate(depDateController.text), parseTime(depTimeController.text)),
        returnTime: combineDate(parseDate(retDateController.text), parseTime(retTimeController.text)),
        id: "Change this later",
    );
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Destination",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Final Address"
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: (content) {
                if (content != null) {
                  if (content.isNotEmpty) {
                    return null;
                  }
                }
                return "Please enter an address";
              },
            ),
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          labelText: "City"
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      validator: (content) {
                        if (content != null) {
                          if (content.isNotEmpty) {
                            return null;
                          }
                        }
                        return "Please enter a city";
                      },
                    ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: zipController,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Zip"
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: (content) {
                      if (content != null) {
                        if (content.isNotEmpty) {
                          return null;
                        }
                      }
                      return "Please enter a zip code";
                    },
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
              value: state,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "State"
              ),
              onChanged: (value) {
                print("selected ${value}");
              },
              validator: (content) {
                content != null && content != "Select"
                    ? null
                    : "Please select a state";
              },
              items: buildStateOptions(),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Emergency Contact Name"
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: (content) {
                if (content != null) {
                  if (content.isNotEmpty) {
                    return null;
                  }
                }
                return "Please enter an emergency contact";
              },
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Emergency Contact Phone"
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: (content) {
                if (content != null) {
                  if (content.isNotEmpty) {
                    return null;
                  }
                }
                return "Please enter a phone number";
              },
            ),
            Divider(
              thickness: 1,
              height: 40,
              indent: 10,
              endIndent: 10,
            ),
            Text(
              "Departure",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: DateFormField(
                    controller: depDateController,
                    label: "Departure Date",
                    validator: (content) {
                      if (content != null) {
                        if (content.isNotEmpty) {
                          return null;
                        }
                      }
                      return "Please enter a date";
                    },
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 4,
                  child: TimeFormField(
                    controller: depTimeController,
                    label: "Departure Time",
                    validator: (content) {
                      if (content != null) {
                        if (content.isNotEmpty) {
                          TimeOfDay time = parseTime(depTimeController.text);
                          DateTime date = parseDate(depDateController.text);
                          DateTime givenDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                          DateTime present = DateTime.now();
                          if (givenDate.compareTo(present) < 1) {
                            return "Return time in past";
                          }
                          return null;
                        }
                      }
                      return "Please enter a time";
                    },
                  ),
                )
              ],
            ),
            LeaveMethodSubform(type: LeaveMethodSubformType.departure, controller: depMethodController,),
            Divider(
              thickness: 1,
              height: 40,
              indent: 10,
              endIndent: 10,
            ),
            Text(
              "Return",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: DateFormField(
                    controller: retDateController,
                    label: "Return Date",
                    validator: (content) {
                      if (content != null) {
                        if (content.isNotEmpty) {
                          return null;
                        }
                      }
                      return "Please enter a date";
                    },
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 4,
                  child: TimeFormField(
                    controller: retTimeController,
                    label: "Return Time",
                    validator: (content) {
                      if (content != null) {
                        if (content.isNotEmpty) {
                          TimeOfDay time = parseTime(retTimeController.text);
                          DateTime date = parseDate(retDateController.text);
                          DateTime givenDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                          DateTime present = DateTime.now();
                          if (givenDate.compareTo(present) < 1) {
                            return "Return time in past";
                          }
                          return null;
                        }
                      }
                      return "Please enter a time";
                    },
                  ),
                )
              ],
            ),
            LeaveMethodSubform(type: LeaveMethodSubformType.arrival, controller: retMethodController),
            buildSubmissionBar(),
          ],
        )
    );
  }
}