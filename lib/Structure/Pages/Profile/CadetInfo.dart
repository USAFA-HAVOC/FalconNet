import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';

import '../../../Model/Store/Actions/InfoAction.dart';

///Cadet Information tab
///Displays editable personal information
class CadetInfo extends StatelessWidget {
  const CadetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<User>>(
      converter: (store) =>
          ViewModel<User>(store: store, content: store.state.user),
      builder: (context, model) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              InputBlock(
                label: "Name",
                disabled: true,
                initial: model.content.personal_info.full_name,
                onSubmit: (input) {},
              ),

              const SizedBox(
                height: 20,
              ),

              InputBlock(
                label: "Phone Number",
                onSubmit: (value) => model.dispatch(InfoAction(
                    modify: (b) => b..personal_info.phone_number = value)),
                validator: (String? value) =>
                    (value ?? "").characters.length < 10
                        ? "Phone number must have at least ten characters"
                        : null,
                hint: "(123) 456-789",
                initial: model.content.personal_info.phone_number,
              ),

              const SizedBox(
                height: 20,
              ),

              InputBlock(
                label: "Room Number",
                onSubmit: (value) => model.dispatch(InfoAction(
                    modify: (b) => b
                      ..personal_info.room_number =
                          value?.trim().toUpperCase())),
                validator: (String? value) {
                  if (value == null) {
                    return "Must enter a valid room";
                  }
                  if ((<String>["AWAY"]
                      .any((b) => value.toUpperCase().startsWith(b)))) {
                    return value.trim().length == 4 ? null : "No room number required with Away";
                  }
                  if (!(<String>["SIJAN", "VANDY", "AWAY"]
                      .any((b) => value.toUpperCase().startsWith(b)))) {
                    return "Must start with either Sijan or Vandy or Away";
                  }
                  if (value.trim().split(" ").length < 2) {
                    return "Must include both a building and room number";
                  }
                  if (value.trim().split(" ").length > 2) {
                    return "Must only include a building and room number";
                  }
                  var number = value.trim().split(" ").last;
                  if (number.length < 3 || number.length > 5) {
                    return "Room number must be 3-5 characters long";
                  }
                  return null;
                },
                hint: "eg. 1A11",
                initial: model.content.personal_info.room_number,
              ),
              const SizedBox(
                height: 20,
              ),
              InputBlock(
                label: "Unit",
                disabled: true,
                initial: model.content.assigned_unit,
                onSubmit: (input) {},
              ),
            ],
          ),
        );
      },
    );
  }
}

///Stylized input block for personal info blocks
class InputBlock extends StatefulWidget {
  final void Function(String?) onSubmit;
  final String? Function(String?)? validator;
  final String? hint;
  final String? initial;
  final String? label;
  final bool disabled;

  const InputBlock(
      {super.key,
      required this.onSubmit,
      this.validator,
      this.hint,
      this.initial,
      this.label,
      this.disabled = false});

  @override
  State<InputBlock> createState() => InputBlockState();
}

class InputBlockState extends State<InputBlock> {
  late TextEditingController controller;
  bool selected = false;
  String? value;

  ///Initializes controller value
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initial);
    value = widget.initial;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void attemptSubmit(String? value) {
    if (widget.validator?.call(value) == null) {
      widget.onSubmit(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
        child: Focus(
      //Toggles focus state
      onFocusChange: (focused) => setState(() {
        selected = focused;
        if (!focused) {
          widget.onSubmit(controller.text);
        }
      }),

      child: TextField(
        readOnly: widget.disabled,
        controller: controller,
        onChanged: (change) => setState(() {
          value = change;
        }),
        style: Theme.of(context).textTheme.bodyMedium,

        /*
            Displays error text when validation fails
            When not focused on, box has focus background
             */
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.titleSmall,
          hintText: widget.hint,
          errorText: widget.validator?.call(value),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).focusColor),
          ),
          filled: !selected || widget.disabled,
          fillColor: widget.disabled
              ? Theme.of(context).disabledColor
              : Theme.of(context).focusColor,
        ),
      ),
    ));
  }
}
