import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

///A custom field for selecting a date in a form.
///Overrides functionality of a TextFormField by launching date picker
///on user interaction. Output is formatted as a string and contained in
///the text field. Manual input is disabled.
class DateFormField extends StatefulWidget {
  //TextController for child text field
  final TextEditingController dateInput;
  final String? Function(String?)? validator;

  //Label on field decoration
  final String? label;


  const DateFormField({
    super.key,
    required TextEditingController controller,
    this.validator,
    this.label
  }) : dateInput = controller;

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

      //Launches date picker on tap
      onTap: () async {

        //Uses given input as initial value and present as earliest date
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: parseDate(widget.dateInput.text),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );

        //If picked date isn't null, set text editing state
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