import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/Cadet.dart';
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
    return StoreConnector<GlobalState, ViewModel<Cadet>>(
        converter: (store) => ViewModel<Cadet>(store: store, content: store.state.cadet),
        builder: (context, model) {
          return ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SizedBox(height: 20,),

              InputBlock(
                label: "Name",
                onSubmit: (value) => model.dispatch(InfoAction(property: CadetProperty.name, value: value)),
                validator: (String? value) => (value ?? "").characters.length >= 6,
                error: "Name must have at least six characters",
                hint: "Jane Doe",
                initial: model.content.name,
              ),

              SizedBox(height: 20,),

              InputBlock(
                label: "Phone Number",
                onSubmit: (value) => model.dispatch(InfoAction(property: CadetProperty.phone, value: value)),
                validator: (String? value) => (value ?? "").characters.length >= 10,
                error: "Phone number must have at least ten characters",
                hint: "(123) 456-789",
                initial: model.content.phone,
              ),

              SizedBox(height: 20,),

              InputBlock(
                label: "Room Number",
                onSubmit: (value) => model.dispatch(InfoAction(property: CadetProperty.room, value: value)),
                validator: (String? value) => (value ?? "").characters.length >= 3,
                error: "Room must have at least three characters",
                hint: "room #",
                initial: model.content.room,
              ),

              SizedBox(height: 20,),

              InputBlock(
                label: "Squadron",
                onSubmit: (value) => model.dispatch(InfoAction(property: CadetProperty.squadron, value: int.parse(value!))),
                validator: (String? value) => 0 < (int.tryParse(value ?? "0") ?? 0) && (int.tryParse(value ?? "0") ?? 41) < 41,
                error: "Enter a valid squadron",
                hint: "squadron",
                initial: model.content.squadron?.toString(),
              ),
            ],
          );
        }
    );
  }
}

///Stylized input block for personal info blocks
class InputBlock extends StatefulWidget {
  final void Function(String?) onSubmit;
  final bool Function(String?)? validator;
  final String? hint;
  final String? initial;
  final String? error;
  final String? label;

  const InputBlock({super.key, required this.onSubmit, this.validator, this.hint, this.error, this.initial, this.label});

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

  bool validate(String? value) {
    if (widget.validator != null) {
      return widget.validator!(value);
    }
    return false;
  }

  void attemptSubmit(String? value) {
    if (validate(value)) {
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
            controller: controller,
            onChanged: (change) => setState(() {
              value = change;
            }),
            onSubmitted: (value) => attemptSubmit(value),
            style: Theme.of(context).textTheme.bodyMedium,

            /*
            Displays error text when validation fails
            When not focused on, box has focus background
             */
            decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: Theme.of(context).textTheme.titleSmall,
                hintText: widget.hint,
                errorText: validate(value) ? null : widget.error,
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).errorColor,
                    ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor
                    ),
                ),
                filled: !selected,
                fillColor: Theme.of(context).focusColor,
            ),
          ),
        )
    );
  }
}