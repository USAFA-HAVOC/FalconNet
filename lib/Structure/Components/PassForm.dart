import 'dart:core';

import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/DateFormField.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:falcon_net/Structure/Components/TimeFormField.dart';
import 'package:flutter/material.dart';

import '../../Model/Database/PassType.dart';
import '../../Model/Database/User.dart';

class PassParameters {
  final User user;
  final List<CadetPass> history;

  const PassParameters({required this.user, required this.history});
}

///Form for submitting or editing a pass
class PassForm extends StatefulWidget {
  //Closures for submission and cancellation
  final void Function(CadetPass pass) onSubmit;
  final void Function() onCancel;

  final CadetAccountability accountability;

  //Existing pass to be edited
  final CadetPass? existing;

  PassForm({
      super.key,
      required this.onSubmit,
      required this.onCancel,
      required this.accountability,
      CadetPass? editing
  }) : existing = editing?.toLocal();

  @override
  State<PassForm> createState() => PassFormState();
}

class PassFormState extends State<PassForm> with SingleTickerProviderStateMixin {
  //Key for maintaining access to form state across redraws
  final key = GlobalKey<FormState>();

  //Controllers for containing form field contents
  late String dateValue;
  late String timeValue;
  late String type;
  late TextEditingController scaController;
  late TextEditingController descriptionController;
  late String state;
  late TextEditingController cityController;

  //Controllers for expansion animation
  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.fastOutSlowIn,
  );

  ///Initialize controller values from either existing pass or defaults
  @override
  void initState() {
    super.initState();
    type = widget.existing?.pass_type ?? (DateTime.now().weekday < 5 ? PassType.day.name : PassType.weekend.name);

    if (widget.existing != null) {
      dateValue = describeDate(widget.existing!.end_time);
      timeValue =
          describeTime(TimeOfDay.fromDateTime(widget.existing!.end_time));
    }
    else {
      var offset = DateTime.now().add(const Duration(hours: 2));
      dateValue = describeDate(offset);
      timeValue = describeTime(TimeOfDay.fromDateTime(offset));
    }

    scaController = TextEditingController(text: widget.existing?.sca_number);
    descriptionController =
        TextEditingController(text: widget.existing?.description);
    state = widget.existing?.state ?? "Colorado";
    cityController = TextEditingController(
        text: widget.existing?.city ?? "Colorado Springs");
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  ///Maximizes pass duration based on pass type and current time
  void maximizePass() {
    //Implement a model call to determine latest possible time
    var last = PassTypeNames.parse(type).duration(widget.accountability.class_year_idx);

    if (last != null) {
      setState(() {
        dateValue = describeDate(last);
        timeValue = describeTime(TimeOfDay(hour: last.hour, minute: last.minute));
      });
    }

    else {
      var def = DateTime.now().add(const Duration(days: 1));
      setState(() {
        dateValue = describeDate(def);
        timeValue = describeTime(TimeOfDay(hour: def.hour, minute: def.minute));
      });
    }
  }

  ///Format pass object based on form data
  ///Requires valid inputs in all fields
  ///Should only be called after form has been validated
  CadetPass formatPass(String id) {
    var endDate = parseDate(dateValue);
    var endTime = parseTime(timeValue);
    return CadetPass((b) => b
      ..id = widget.existing?.id
      ..cadet_id = id
      ..start_time = widget.existing?.start_time ?? DateTime.now()
      ..end_time = combineDate(endDate, endTime)
      ..pass_type = type
      ..description = descriptionController.text
      ..sca_number = scaController.text == "" ? null : scaController.text
      ..city = cityController.text
      ..state = state
    ).toUtc();
  }

  ///Builds type options based on current date
  List<DropdownMenuItem<String>> buildTypeOptions(CadetAccountability accountability) {
    Map<String, String> options = <String, String>{
      PassType.discretionary.description() : PassType.discretionary.name,
      PassType.sca.description() : PassType.sca.name,
      PassType.esss.description() : PassType.esss.name,
    };

    if (DateTime.now().weekday < DateTime.friday) {
      options.addAll({
        PassType.day.description(): PassType.day.name
      });
      if ((accountability.weekday_overnight_passes ?? 1) > 0 && accountability.class_year_idx != 0) {
        options.addAll({
          PassType.weekday_overnight.description() : PassType.weekday_overnight.name
        });
      }
    }
    else {
      if (accountability.class_year_idx == 0 && DateTime.now().weekday == DateTime.sunday) {
        options.addAll({
          PassType.sunday.description() : PassType.sunday.name
        });
      }
      if ((accountability.weekend_overnight_passes ?? 1) > 0) {
        options.addAll({
          PassType.weekend.description() : PassType.weekend.name
        });
      }
    }

    return options.map(
      (key, value) => MapEntry(
        key,
        DropdownMenuItem<String>(
          value: value,
          child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    ).values.toList();
  }

  ///Builds state menu options
  List<DropdownMenuItem<String>> buildStateOptions() {
    List<String> options = <String>[
      "Alaska", "Alabama", "Arkansas", "Arizona", "California", "Colorado",
      "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia",
      "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky",
      "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan",
      "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina",
      "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico",
      "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
      "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
      "Utah", "Virginia", "Vermont", "Washington", "Wisconsin", "West Virginia",
      "Wyoming",
    ];

    //Map the strings to menu items
    return options.map(
      (key) => DropdownMenuItem<String>(
        value: key,
        child: Text(
          key,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<PassParameters>>(
        converter: (store) => ViewModel<PassParameters>(
            store: store,
            content: PassParameters(
              user: store.state.user,
              history: store.state.history.toList()
            )
        ),
        builder: (context, model) => Form(
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

                      //Called when a new type options is selected
                      onChanged: (value) {
                        //If sca is selected, extend sca number option
                        if (value == PassType.sca.name) {
                          animationController.animateTo(1.0);
                        }

                        //Otherwise close sca field
                        else {
                          animationController.animateTo(0.0);
                          scaController.text = "";
                        }

                        //Set value
                        type = value!;
                      },
                      items: buildTypeOptions(widget.accountability),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //Animation for extending the sca form option
                    SizeTransition(
                      sizeFactor: animation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: scaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                labelText: "SCA Number"
                            ),
                            style: Theme.of(context).textTheme.bodyLarge,

                            //Requires input only if selected pass type is sca
                            validator: (content) {
                              if (type == PassType.sca.name) {
                                return InputValidation.stringLength(
                                    emptyMessage: "Please enter an SCA number"
                                )(content);
                              }
                              return null;
                            },
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),

                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          labelText: "Address"
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      validator: InputValidation.stringLength(
                          emptyMessage: "Please enter an address"
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    DropdownButtonFormField(
                      value: state,
                      decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          labelText: "State"
                      ),
                      onChanged: (value) {
                        setState(() {
                          state = value!;
                        });
                      },
                      validator: InputValidation.dropdown(),
                      items: buildStateOptions(),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle:
                          Theme.of(context).textTheme.bodyLarge,
                          labelText: "City"
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      validator: InputValidation.stringLength(
                          emptyMessage: "Please enter a city"),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: DateFormField(
                            value: dateValue,
                            label: "Return Date",
                            validator: (date) {
                              var max = PassTypeNames.parse(type).duration(widget.accountability.class_year_idx);
                              if (max != null && date != null) {
                                if (combineDate(parseDate(date), parseTime(timeValue)).isAfter(max)) {
                                  return "Exceeds pass limits";
                                }
                              }
                              return InputValidation.date()(date);
                            },
                            onChanged: (change) {
                              setState(() {
                                dateValue = change;
                              });
                            },
                          ),
                        ),

                        const Spacer(flex: 1),

                        Expanded(
                          flex: 4,
                          child: TimeFormField(
                            value: timeValue,
                            label: "Return Time",
                            validator: (time) {
                              var max = PassTypeNames.parse(type).duration(widget.accountability.class_year_idx);
                              if (max != null && time != null) {
                                if (combineDate(parseDate(dateValue), parseTime(time)).isAfter(max)) {
                                  return "Exceeds pass limits";
                                }
                              }

                              return InputValidation.time(date: parseDate(dateValue))(time);
                            },
                            onChanged: (change) {
                              setState(() {
                                timeValue = change;
                              });
                            },
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        maximizePass();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Max Duration',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                //If form entries are valid, call submission closure with formatted pass
                                if (key.currentState!.validate()) {
                                  widget.onSubmit(formatPass(model.content.user.id!));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    'Submit',
                                    style: Theme.of(context).textTheme.labelLarge
                                ),
                              ),
                            ),
                          ),
                        ),

                        const Spacer(flex: 1),

                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey)),
                            onPressed: () => widget.onCancel(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Cancel',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
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
