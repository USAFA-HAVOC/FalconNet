import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/Actions/LeaveAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../Components/DateFormField.dart';
import '../../Components/TimeFormField.dart';
import 'MethodSubform/LeaveMethodSubform.dart';

class LeaveModelTuple {
  CadetLeave? leave;
  String id;

  LeaveModelTuple({required this.leave, required this.id});
}

///Leave locator form
///Animates sub form expansion to ensure all required data is acquired
class LeaveLocatorForm extends StatefulWidget {
  final CadetLeave? existing;

  //Whether form is in a dialog
  final bool dialog;

  //Closure called on submission
  final void Function()? onSubmit;

  LeaveLocatorForm(
      {super.key, CadetLeave? editing, this.dialog = true, this.onSubmit})
      : existing = editing?.toLocal();

  @override
  State<LeaveLocatorForm> createState() => LeaveLocatorFormState();
}

class LeaveLocatorFormState extends State<LeaveLocatorForm> {
  //Global key for maintaining form state
  final key = GlobalKey<FormState>();

  //Controllers for plain text fields
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController zipController;
  late String state;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late String depDateValue;
  late String depTimeValue;
  late String retDateValue;
  late String retTimeValue;

  //Controllers for retrieving subform values
  late SubformController<CadetLeaveTransportMethod> depMethodController;
  late SubformController<CadetLeaveTransportMethod> retMethodController;

  ///Initializes controllers values based on leave data or defaults
  @override
  void initState() {
    super.initState();
    addressController =
        TextEditingController(text: widget.existing?.final_address);
    cityController = TextEditingController(text: widget.existing?.final_city);
    zipController = TextEditingController(text: widget.existing?.final_zip);
    state = widget.existing?.final_state ?? "Colorado";
    nameController =
        TextEditingController(text: widget.existing?.emergency_contact_name);
    phoneController =
        TextEditingController(text: widget.existing?.emergency_contact_phone);
    depDateValue =
        describeDate(widget.existing?.departure_time ?? DateTime.now());
    depTimeValue =
        describeTime(timeOf(widget.existing?.departure_time ?? DateTime.now()));
    retDateValue = describeDate(widget.existing?.return_time ?? DateTime.now());
    retTimeValue =
        describeTime(timeOf(widget.existing?.return_time ?? DateTime.now()));
    depMethodController = SubformController<CadetLeaveTransportMethod>(
        value: widget.existing?.departure_method);
    retMethodController = SubformController<CadetLeaveTransportMethod>(
        value: widget.existing?.return_method);
  }

  ///Build state options
  List<DropdownMenuItem<String>> buildStateOptions() {
    List<String> options = <String>[
      "Alaska",
      "Alabama",
      "Arkansas",
      "Arizona",
      "California",
      "Colorado",
      "Connecticut",
      "DC",
      "Delaware",
      "Florida",
      "Georgia",
      "Hawaii",
      "Iowa",
      "Idaho",
      "Illinois",
      "Indiana",
      "Kansas",
      "Kentucky",
      "Louisiana",
      "Massachusetts",
      "Maryland",
      "Maine",
      "Michigan",
      "Minnesota",
      "Missouri",
      "Mississippi",
      "Montana",
      "North Carolina",
      "North Dakota",
      "Nebraska",
      "New Hampshire",
      "New Jersey",
      "New Mexico",
      "Nevada",
      "New York",
      "Ohio",
      "Oklahoma",
      "Oregon",
      "Pennsylvania",
      "Rhode Island",
      "South Carolina",
      "South Dakota",
      "Tennessee",
      "Texas",
      "Utah",
      "Virginia",
      "Vermont",
      "Washington",
      "Wisconsin",
      "West Virginia",
      "Wyoming",
      "Select"
    ];

    //Map each to a menu item
    return options
        .map((key) => DropdownMenuItem<String>(
            value: key,
            child: Text(key, style: Theme.of(context).textTheme.bodyLarge)))
        .toList();
  }

  //Builds submission bar based on present state
  Widget buildSubmissionBar(BuildContext context) {
    var messenger = ScaffoldMessenger.of(context);
    Widget submit = Expanded(
        flex: 5,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: StoreConnector<GlobalState, ViewModel<LeaveModelTuple>>(
              converter: (store) => ViewModel<LeaveModelTuple>(
                  store: store,
                  content: LeaveModelTuple(
                      leave: store.state.user.accountability?.current_leave,
                      id: store.state.user.id!)),
              builder: (context, model) {
                return ElevatedButton(
                  //Attempts to validate form, then closes dialog if applicable
                  //Then, dispatches set leave action with leave data
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      if (widget.dialog) {
                        Navigator.of(context).pop();
                      }
                      model.dispatch(
                        LeaveAction.set(
                          formatLeave(model.content.id),
                          onSucceed: () {
                            FirebaseAnalytics.instance
                                .logEvent(name: 'leave-locator-success');
                            messenger.showSnackBar(
                              const SnackBar(
                                  content: Text("Leave Data Submitted")),
                            );
                          },
                          onFail: () {
                            FirebaseAnalytics.instance
                                .logEvent(name: 'leave-locator-fail');
                            messenger.showSnackBar(
                              const SnackBar(
                                  content: Text("Failed to Submit Leave Data")),
                            );
                          },
                        ),
                      );
                    }
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                );
              },
            )));
    List<Widget> cancel = [
      const Spacer(flex: 1),
      Expanded(
        flex: 5,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.grey),
          ),

          //Closes dialog if nessecary
          onPressed: () {
            if (widget.dialog) {
              Navigator.of(context).pop();
            }
          },

          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Cancel'),
          ),
        ),
      ),
    ];

    //Includes cancel button only if in dialog
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.dialog ? [submit] + cancel : [submit],
    );
  }

  ///Formats leave object based on field values
  CadetLeave formatLeave(String id) {
    return CadetLeave((b) => b
      ..departure_method = depMethodController.retrieve().toBuilder()
      ..return_method = retMethodController.retrieve().toBuilder()
      ..emergency_contact_name = nameController.text
      ..emergency_contact_phone = phoneController.text
      ..final_zip = zipController.text
      ..final_state = state
      ..final_city = cityController.text
      ..final_address = addressController.text
      ..departure_time =
          combineDate(parseDate(depDateValue), parseTime(depTimeValue))
      ..return_time =
          combineDate(parseDate(retDateValue), parseTime(retTimeValue))
      ..cadet_id = id
      ..id = widget.existing?.id).toUtc();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Destination",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            TextFormField(
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Final Address"),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: InputValidation.stringLength(
                  emptyMessage: "Please enter an address"),
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    controller: cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "City"),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: InputValidation.stringLength(
                        emptyMessage: "Please enter a city"),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: zipController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Zip"),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: InputValidation.stringLength(
                        length: 5, emptyMessage: "Please enter a zip code"),
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
              value: state,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "State"),
              onChanged: (value) {
                setState(() {
                  state = value!;
                });
              },
              validator: InputValidation.dropdown(),
              items: buildStateOptions(),
            ),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Emergency Contact Name"),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: InputValidation.stringLength(
                  emptyMessage: "Please enter a name"
              ),
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Emergency Contact Phone"),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: InputValidation.stringLength(
                  emptyMessage: "Please enter a phone number"),
            ),
            const Divider(
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
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    value: depDateValue,
                    label: "Departure Date",
                    validator: InputValidation.date(),
                    onChanged: (change) => setState(() {
                      depDateValue = change;
                      if (!parseDate(depDateValue)
                          .isBefore(parseDate(retDateValue))) {
                        retDateValue = change;
                      }
                    }),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 4,
                  child: TimeFormField(
                    value: depTimeValue,
                    label: "Departure Time",
                    validator:
                        InputValidation.time(date: parseDate(depDateValue)),
                    onChanged: (change) => setState(() {
                      depTimeValue = change;
                    }),
                  ),
                )
              ],
            ),
            LeaveMethodSubform(
              type: LeaveMethodSubformType.departure,
              controller: depMethodController,
            ),
            const Divider(
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
                    firstDate: parseDate(depDateValue),
                    value: retDateValue,
                    label: "Return Date",
                    validator: InputValidation.date(),
                    onChanged: (change) => setState(() {
                      retDateValue = change;
                    }),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 4,
                  child: TimeFormField(
                    value: retTimeValue,
                    label: "Return Time",
                    validator:
                        InputValidation.time(date: parseDate(retDateValue)),
                    onChanged: (change) => setState(() {
                      retTimeValue = change;
                    }),
                  ),
                )
              ],
            ),
            LeaveMethodSubform(
                type: LeaveMethodSubformType.arrival,
                controller: retMethodController),
            buildSubmissionBar(context),
          ],
        ));
  }
}
