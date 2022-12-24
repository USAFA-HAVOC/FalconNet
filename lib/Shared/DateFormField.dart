import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';

class DateFormField extends StatefulWidget {
  final TextEditingController dateInput;
  final String? Function(String?)? validator;
  final String? label;
  const DateFormField({super.key, required TextEditingController controller, this.validator, this.label}) : dateInput = controller;

  @override
  State<DateFormField> createState() => DateFormFieldState();
}

class DateFormFieldState extends State<DateFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.dateInput,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          labelText: widget.label
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: parseDate(widget.dateInput.text),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          DateTime local = pickedDate.toLocal();
          String formattedDate = describeDate(local);
          setState(() {
            widget.dateInput.text = formattedDate;
          });
        }
      },
    );
  }
}