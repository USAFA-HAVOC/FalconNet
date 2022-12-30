import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:falcon_net/Utility/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../../Model/Data/Leave.dart';
import 'LeaveMethodSubform.dart';

///Subform for other method
class OtherMethodSubform extends StatefulWidget {
  final SubformController<LeaveMethod> controller;
  final LeaveMethodSubformType type;

  const OtherMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<OtherMethodSubform> createState() => OtherMethodSubformState();
}

class OtherMethodSubformState extends State<OtherMethodSubform> {
  late TextEditingController info;

  ///Initialize controller values from given data for fields
  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null && widget.controller.value is OtherMethod) {
      OtherMethod operant = widget.controller.value! as OtherMethod;
      info = TextEditingController(text: operant.info);
    }
    else {
      info = TextEditingController();
    }

    //Initialize controller retrieval function to own build function
    widget.controller.retrieve = buildLeaveMethod;
  }

  ///Build leave method from field data
  @override
  OtherMethod buildLeaveMethod() {
    return OtherMethod(
      info: info.text,
    );
  }

  @override
  Widget build(BuildContext context) {

    //Text field with minimum of four lines to display as textarea
    return TextFormField(
      controller: info,
      maxLines: null,
      minLines: 4,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          labelText: "Description"
      ),
      style: Theme.of(context).textTheme.bodyLarge,
      validator: InputValidation.stringLength(length: 0, emptyMessage: "Please enter a description"),
    );
  }
}