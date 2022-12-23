import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';

class TimeFormField extends StatefulWidget {
  final TextEditingController timeInput;
  final String? Function(String?)? validator;

  const TimeFormField({super.key, required TextEditingController controller, this.validator}) : timeInput = controller;

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
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.timer),
          labelText: "Return Time"
      ),
      readOnly: true,
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
            initialEntryMode: TimePickerEntryMode.input,
            context: context,
            initialTime: parseTime(widget.timeInput.text)
        );

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