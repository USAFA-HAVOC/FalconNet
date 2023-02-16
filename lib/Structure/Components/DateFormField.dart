import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

///A custom field for selecting a date in a form.
///Overrides functionality of a TextFormField by launching date picker
///on user interaction. Output is formatted as a string and contained in
///the text field. Manual input is disabled.
class DateFormField extends StatefulWidget {

  final String? Function(String?)? validator;
  final String? label;
  final void Function(String)? onChanged;
  final String? value;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateFormField({
    super.key,
    this.validator,
    this.label,
    this.onChanged,
    this.value,
    this.firstDate,
    this.lastDate
  });

  @override
  State<DateFormField> createState() => DateFormFieldState();
}

class DateFormFieldState extends State<DateFormField> {
  late String value;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    value = widget.value ?? describeDate(DateTime.now().toUtc());
    controller = TextEditingController(text: value);
    return TextFormField(
      controller: controller,
      validator: widget.validator,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          labelText: widget.label
      ),
      readOnly: true,

      //Launches date picker on tap
      onTap: () async {

        //Uses given input as initial value and present as earliest date
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: parseDate(value),
          firstDate: widget.firstDate ?? DateTime.now().toUtc(),
          lastDate: widget.lastDate ?? DateTime(2300),
        );

        //If picked date isn't null, set text editing state
        if (pickedDate != null) {
          DateTime local = pickedDate.toLocal();
          String formattedDate = describeDate(local);
          setState(() {
            value = formattedDate;
            controller.text = value;
            if (widget.onChanged != null) {
              widget.onChanged!(formattedDate);
            }
          });
        }
      },
    );
  }
}