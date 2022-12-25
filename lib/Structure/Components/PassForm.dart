import 'dart:core';

import 'package:falcon_net/Model/Data/Pass.dart';
import 'package:falcon_net/Structure/Components/DateFormField.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:falcon_net/Structure/Components/TimeFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Model/Store/GlobalState.dart';

class PassForm extends StatefulWidget {
  final void Function(Pass pass) onSubmit;
  final void Function() onCancel;
  final Pass? existing;

  const PassForm({super.key, required this.onSubmit, required this.onCancel, this.existing});

  @override
  State<PassForm> createState() => PassFormState();
}

class PassFormState extends State<PassForm> with SingleTickerProviderStateMixin {
  final key = GlobalKey<FormState>();
  late TextEditingController dateController;
  late TextEditingController timeController;
  late String type;
  late TextEditingController scaController;
  late TextEditingController descriptionController;
  late String state;
  late TextEditingController cityController;
  late TextEditingController zipController;

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    type = DateTime.now().weekday < 5 ? "weekday" : "weekend";
    
    if (widget.existing != null) {
      dateController = TextEditingController(text: describeDate(widget.existing!.end!));
      timeController = TextEditingController(text: describeTime(TimeOfDay.fromDateTime(widget.existing!.end!)));
    }
    else {
      dateController = TextEditingController(text: describeDate(DateTime.now()));
      timeController = TextEditingController(text: describeTime(TimeOfDay(hour: 19, minute: 50)));
    }
    
    scaController = TextEditingController(text: widget.existing?.sca);
    descriptionController = TextEditingController(text: widget.existing?.description);
    state = widget.existing?.state ?? "Colorado";
    cityController = TextEditingController(text: widget.existing?.city ?? "Colorado Springs");
    zipController = TextEditingController(text: widget.existing?.zip ?? "80841");
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void maximizePass() {

    //Implement a model call to determine latest possible time
    var last = DateTime.now().toLocal();

    setState(() {
      dateController.text = describeDate(last);
      timeController.text = describeTime(TimeOfDay(hour: last.hour, minute: last.minute));
    });
  }

  Pass formatPass() {
    var endDate = parseDate(dateController.text);
    var endTime = parseTime(timeController.text);
    return Pass(
      start: widget.existing?.start ?? DateTime.now(),
      end: combineDate(endDate, endTime),
      type: type,
      description: descriptionController.text,
      sca: scaController.text == "" ? null : scaController.text,
      city: cityController.text,
      state: state,
      zip: zipController.text,
    );
  }

  List<DropdownMenuItem<String>> buildTypeOptions() {
    Map<String, String> options = <String, String>{};

    if (DateTime.now().weekday < 5) {
      options.addAll({"Weekday Sign-Out Period" : "weekday"});
    }
    else {
      options.addAll({"Weekend Sign-Out Period" : "weekend"});
    }

    options.addAll({
      "Discretionary" : "discretionary",
      "SCA" : "sca",
      "eSSS" : "esss",
    });

    return options.map((key, value) => MapEntry(key, DropdownMenuItem<String>(
        value: value,
        child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge
        )
    ))).values.toList();
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
      "West Virginia", "Wyoming",
    ];

    assert(options.length == 51);

    return options.map((key) => DropdownMenuItem<String>(
            value: key,
            child: Text(
                key,
                style: Theme.of(context).textTheme.bodyLarge
            )
        )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) => Form(
            key: key,
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField(
                      value: type,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          labelText: "Pass Type"
                      ),
                      onChanged: (value) {
                        if (value == "sca") {
                          animationController.animateTo(1.0);
                        }
                        else {
                          animationController.animateTo(0.0);
                          scaController.text = "";
                        }
                        type = value!;
                      },
                      items: buildTypeOptions(),
                    ),
                    SizedBox(height: 10,),
                    SizeTransition(
                      sizeFactor: animation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: scaController,
                            decoration: InputDecoration(
                                labelStyle: Theme.of(context).textTheme.bodyLarge,
                                labelText: "SCA Number"
                            ),
                            style: Theme.of(context).textTheme.bodyLarge,
                            validator: (content) {
                              if (type == "sca") {
                                if (content != null) {
                                  if (content.isNotEmpty) {
                                    return null;
                                  }
                                }
                                return "Please enter an SCA number";
                              }
                            },
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          labelText: "Description"
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      validator: (content) {
                        if (content != null) {
                          if (content.characters.isNotEmpty) {
                            return null;
                          }
                        }
                        return "Please enter a description";
                      },
                    ),
                    SizedBox(height: 10,),
                    DropdownButtonFormField(
                      value: state,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          labelText: "State"
                      ),
                      onChanged: (value) {
                        print("selected ${value}");
                      },
                      items: buildStateOptions(),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
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
                        Spacer(flex: 1),
                        Expanded(
                          flex: 3,
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
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: DateFormField(
                            controller: dateController,
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
                            controller: timeController,
                            label: "Return Time",
                            validator: (content) {
                              if (content != null) {
                                if (content.isNotEmpty) {
                                  TimeOfDay time = parseTime(timeController.text);
                                  DateTime date = parseDate(dateController.text);
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
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        maximizePass();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: const Text('Max Duration'),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    widget.onSubmit(formatPass());
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: const Text('Submit'),
                                ),
                              ),
                            )
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                            ),
                            onPressed: () {
                              widget.onCancel();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Cancel'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }
}