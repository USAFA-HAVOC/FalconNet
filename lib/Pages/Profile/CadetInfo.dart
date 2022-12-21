import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Shared/PaddedColumn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CadetInfo extends StatelessWidget {
  const CadetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
        builder: (context, store) {
          return ListView(
            children: [
              Text(
                  "Name",
                  style: Theme.of(context).textTheme.titleSmall
              ),
              InputBlock(
                onSubmit: (value) => {},
                validator: (String? value) => (value ?? "").characters.length < 6,
                error: "Name must have at least six characters",
                hint: "Jane Doe",
                initial: store.state.cadet.name,
              ),
              SizedBox(height: 10,),
              Text(
                  "Phone Number",
                  style: Theme.of(context).textTheme.titleSmall
              ),
              InputBlock(
                onSubmit: (value) => {},
                validator: (String? value) => (value ?? "").characters.length < 10,
                error: "Name must have at least ten characters",
                hint: "(123) 456-789",
                initial: store.state.cadet.phone,
              ),
              SizedBox(height: 10,),
              Text(
                  "Room Number",
                  style: Theme.of(context).textTheme.titleSmall
              ),
              InputBlock(
                onSubmit: (value) => {},
                validator: (String? value) => (value ?? "").characters.length < 3,
                error: "Room must have at least three characters",
                hint: "room #",
                initial: store.state.cadet.room,
              ),
              SizedBox(height: 10,),
              Text(
                  "Squadron",
                  style: Theme.of(context).textTheme.titleSmall
              ),
              InputBlock(
                onSubmit: (value) => {},
                validator: (String? value) => 0 < int.parse(value ?? "0") && int.parse(value ?? "0") < 41,
                error: "Enter vlid squadron",
                hint: "squadron",
                initial: store.state.cadet.squadron?.toString(),
              ),
            ],
          );
        }
    );
  }
}

class InputBlock extends StatefulWidget {
  final void Function(String?) onSubmit;
  final bool Function(String?)? validator;
  final String? hint;
  final String? initial;
  final String? error;
  const InputBlock({super.key, required this.onSubmit, this.validator, this.hint, this.error, this.initial});

  @override
  State<InputBlock> createState() => InputBlockState();
}

class InputBlockState extends State<InputBlock> {
  late TextEditingController controller;
  bool selected = false;
  String? value;

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
          onFocusChange: (focused) => setState(() {
            selected = focused;
          }),
          child: TextField(
            controller: controller,
            onChanged: (change) => setState(() {
              value = change;
            }),
            onSubmitted: (value) => attemptSubmit(value),
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
                hintText: widget.hint,
                errorText: validate(value) ? widget.error : null,
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).errorColor
                    )
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor
                    )
                ),
                filled: !selected,
                fillColor: Theme.of(context).focusColor
            ),
          ),
        )
    );
  }
}