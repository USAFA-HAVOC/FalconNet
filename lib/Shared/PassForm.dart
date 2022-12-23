import 'dart:core';

import 'package:falcon_net/Model/Pass.dart';
import 'package:falcon_net/Shared/DateFormField.dart';
import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:falcon_net/Shared/TimeFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../Model/GlobalState.dart';

class PassForm extends StatefulWidget {
  const PassForm({super.key});

  @override
  State<PassForm> createState() => PassFormState();
}

class PassFormState extends State<PassForm> with SingleTickerProviderStateMixin {
  final key = GlobalKey<FormState>();
  final dateController = TextEditingController(text: describeDate(DateTime.now()));
  final timeController = TextEditingController(text: describeTime(TimeOfDay(hour: 19, minute: 50)));
  late String type;
  final scaController = TextEditingController();
  final descriptionController = TextEditingController();
  final state = "Colorado";
  final cityController = TextEditingController(text: "Colorado Springs");
  final zipController = TextEditingController(text: "80132");

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
    type = DateTime.now().weekday < 6 ? "weekday" : "weekend";
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

  void submitPass() {
    var endDate = parseDate(dateController.text);
    var endTime = parseTime(timeController.text);
    Pass pass = Pass(
      start: DateTime.now(),
      end: DateTime(endDate.year, endDate.month, endDate.day, endTime.hour, endTime.minute,),
      type: type,
      description: descriptionController.text,
      sca: scaController.text == "" ? null : scaController.text,
      city: cityController.text,
      state: state,
      zip: zipController.text,
    );

    //Submit that to api and return result
  }

  List<DropdownMenuItem<String>> buildTypeOptions() {
    Map<String, String> options = <String, String>{
      "Discretionary" : "discretionary",
      "SCA" : "sca",
      "Weekday Sign-Out Period" : "weekday",
      "Weekend Sign-Out Period" : "weekend",
      "eSSS" : "esss",
    };

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
      "Colorado",
      "Iowa",
      "Minnesota",
    ];
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
                                    Navigator.of(context).pop();
                                    submitPass();
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
                              Navigator.of(context).pop();
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