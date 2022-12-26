import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

///A custom field for selecting a time in a form.
///Overrides functionality of a TextFormField by launching time picker
///on user interaction. Output is formatted as a string and contained in
///the text field. Manual input is disabled.
class TimeFormField extends StatefulWidget {

  //Text controller for text field
  final TextEditingController timeInput;
  final String? Function(String?)? validator;
  final String? label;

  const TimeFormField({
    super.key,
    required TextEditingController controller,
    this.validator,
    this.label
  }) : timeInput = controller;

  @override
  State<TimeFormField> createState() => TimeFormFieldState();
}

class TimeFormFieldState extends State<TimeFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.timeInput,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.timer),
          labelText: widget.label
      ),
      readOnly: true,

      onTap: () async {
        //Launches time picker with previous value as initial time
        TimeOfDay? pickedTime = await showTimePicker(
            initialEntryMode: TimePickerEntryMode.dial,
            context: context,
            initialTime: parseTime(widget.timeInput.text)
        );

        //If a time is picked, format it and set controller text
        if (pickedTime != null) {
          String formattedTime = describeTime(pickedTime);
          setState(() {
            widget.timeInput.text = formattedTime;
          });
        }
      },
    );
  }
}