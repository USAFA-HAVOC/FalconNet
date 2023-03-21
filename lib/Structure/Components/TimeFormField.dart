import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

///A custom field for selecting a time in a form.
///Overrides functionality of a TextFormField by launching time picker
///on user interaction. Output is formatted as a string and contained in
///the text field. Manual input is disabled.
class TimeFormField extends StatefulWidget {

  //Text controller for text field
  final String? Function(String?)? validator;
  final String? label;
  final void Function(String)? onChanged;
  final String? value;

  const TimeFormField({
    super.key,
    this.validator,
    this.label,
    this.onChanged,
    this.value,
  });

  @override
  State<TimeFormField> createState() => TimeFormFieldState();
}

class TimeFormFieldState extends State<TimeFormField> {

  //Looks like doesn't need to be stateful, but...
  //Must remain a stateless widget in order to preserve state across own redraws
  late String value;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {

    /*
    Overrides stateful properties according to present widget properties.
    This is necessary in order to allow ancestors to modify value.
     */
    var value = widget.value ?? describeTime(TimeOfDay.now());
    var controller = TextEditingController(text: value);
    return TextFormField(
      controller: controller,
      validator: widget.validator,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.timer),
          labelText: widget.label
      ),
      readOnly: true,

      onTap: () async {
        //Launches time picker with previous value as initial time
        TimeOfDay? pickedTime = await showTimePicker(
            initialEntryMode: TimePickerEntryMode.dial,
            context: context,
            initialTime: parseTime(value)
        );

        //If a time is picked, format it and set controller text
        if (pickedTime != null) {
          String formattedTime = describeTime(pickedTime);
          setState(() {
            value = formattedTime;
            controller.text = value;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        }
      },
    );
  }
}