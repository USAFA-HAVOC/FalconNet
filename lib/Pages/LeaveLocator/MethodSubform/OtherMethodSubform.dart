import 'package:falcon_net/Pages/LeaveLocator/MethodSubform/LeaveMethodSubform.dart';
import 'package:falcon_net/Shared/TemporalFormatting.dart';
import 'package:flutter/material.dart';

import '../../../Model/Leave.dart';
import '../../../Shared/DateFormField.dart';
import '../../../Shared/TimeFormField.dart';

class OtherMethodSubform extends StatefulWidget {
  final SubformController<LeaveMethod> controller;
  final LeaveMethodSubformType type;

  const OtherMethodSubform({super.key, required this.type, required this.controller});

  @override
  State<OtherMethodSubform> createState() => OtherMethodSubformState();
}

class OtherMethodSubformState extends State<OtherMethodSubform> implements SpecificMethodSubform {
  late TextEditingController info;

  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null && widget.controller.value is OtherMethod) {
      OtherMethod operant = widget.controller.value! as OtherMethod;
      info = TextEditingController(text: operant.info);
    }
    info = TextEditingController();
    widget.controller.retrieve = buildLeaveMethod;
  }

  @override
  OtherMethod buildLeaveMethod() {
    return OtherMethod(
      info: info.text,
    );
  }

  @override
  Widget build(BuildContext context) {
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
      validator: (content) {
        if (content != null) {
          if (content.isNotEmpty) {
            return null;
          }
        }
        return "Please enter a description";
      },
    );
  }
}