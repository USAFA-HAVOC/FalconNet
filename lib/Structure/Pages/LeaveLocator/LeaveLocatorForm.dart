import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/LeaveAction.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';
import '../../../Model/Data/Leave.dart';
import '../../Components/DateFormField.dart';
import '../../Components/TimeFormField.dart';
import 'MethodSubform/LeaveMethodSubform.dart';

///Leave locator form
///Animates sub form expansion to ensure all required data is acquired
class LeaveLocatorForm extends StatefulWidget {
  final Leave? existing;

  //Whether form is in a dialog
  final bool dialog;

  //Closure called on submission
  final void Function()? onSubmit;

  const LeaveLocatorForm({super.key, this.existing, this.dialog = true, this.onSubmit});

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
  late SubformController<LeaveMethod> depMethodController;
  late SubformController<LeaveMethod> retMethodController;

  ///Initializes controllers values based on leave data or defaults
  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.existing?.finalAddress);
    cityController = TextEditingController(text: widget.existing?.finalCity);
    zipController = TextEditingController(text: widget.existing?.finalZip);
    state = widget.existing?.finalState ?? "Colorado";
    nameController = TextEditingController(text: widget.existing?.contactName);
    phoneController = TextEditingController(text: widget.existing?.contactPhone);
    depDateValue = describeDate(widget.existing?.departureTime ?? DateTime.now());
    depTimeValue = describeTime(timeOf(widget.existing?.departureTime ?? DateTime.now()));
    retDateValue = describeDate(widget.existing?.returnTime ?? DateTime.now());
    retTimeValue = describeTime(timeOf(widget.existing?.returnTime ?? DateTime.now()));
    depMethodController = SubformController<LeaveMethod>(value: widget.existing?.departureMethod);
    retMethodController = SubformController<LeaveMethod>(value: widget.existing?.returnMethod);
  }

  ///Build state options
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

    //Map each to a menu item
    return options.map((key) => DropdownMenuItem<String>(
        value: key,
        child: Text(
            key,
            style: Theme.of(context).textTheme.bodyLarge
        )
    )
    ).toList();
  }

  //Builds submission bar based on present state
  Widget buildSubmissionBar() {
    Widget submit = Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: StoreConnector<GlobalState, ViewModel<Leave?>>(
            converter: (store) => ViewModel<Leave?>(store: store, content: store.state.leave),
            builder: (context, model) {
              return ElevatedButton(

                //Attempts to validate form, then closes dialog if applicable
                //Then, dispatches set leave action with leave data
                onPressed: () {
                  if (key.currentState!.validate()) {
                    if (widget.dialog) {
                      Navigator.of(context).pop();
                    }
                    model.dispatch(LeaveAction.set(formatLeave()));
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

          //Closes dialog if nessecary
          onPressed: () {
            if (widget.dialog) {
              Navigator.of(context).pop();
            }
          },

          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: const Text('Cancel'),
          ),
        ),
      ),
    ];

    //Includes cancel button only if in dialog
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.dialog ? [submit] + cancel: [submit],
    );
  }

  ///Formats leave object based on field values
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
        departureTime: combineDate(parseDate(depDateValue), parseTime(depTimeValue)),
        returnTime: combineDate(parseDate(retDateValue), parseTime(retTimeValue)),
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
              validator: InputValidation.stringLength(emptyMessage: "Please enter an address"),
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
                      validator: InputValidation.stringLength(emptyMessage: "Please enter a city"),
                    ),
                ),

                Spacer(flex: 1,),

                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: zipController,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelText: "Zip"
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    validator: InputValidation.stringLength(emptyMessage: "Please enter a zip code"),
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

              //Set value
              onChanged: (value) {
                setState(() {
                  state = value!;
                });;
              },
              validator: InputValidation.dropdown(),
              items: buildStateOptions(),
            ),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Emergency Contact Name"
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: InputValidation.stringLength(emptyMessage: "Please enter a name"),
            ),

            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  labelText: "Emergency Contact Phone"
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              validator: InputValidation.stringLength(emptyMessage: "Please enter a phone number"),
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
                    value: depDateValue,
                    label: "Departure Date",
                    validator: InputValidation.date(),
                    onChanged: (change) => setState(() {
                      depDateValue = change;
                    }),
                  ),
                ),

                Spacer(flex: 1),

                Expanded(
                  flex: 4,
                  child: TimeFormField(
                    value: depTimeValue,
                    label: "Departure Time",
                    validator: InputValidation.time(date: parseDate(depDateValue)),
                    onChanged: (change) => setState(() {
                      depTimeValue = change;
                    }),
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
                    value: retDateValue,
                    label: "Return Date",
                    validator: InputValidation.date(),
                    onChanged: (change) => setState(() {
                      retDateValue = change;
                    }),
                  ),
                ),

                Spacer(flex: 1),

                Expanded(
                  flex: 4,
                  child: TimeFormField(
                    value: retTimeValue,
                    label: "Return Time",
                    validator: InputValidation.time(date: parseDate(retDateValue)),
                    onChanged: (change) => setState(() {
                      retTimeValue = change;
                    }),
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