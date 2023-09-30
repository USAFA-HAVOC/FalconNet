import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/material.dart';
import '../../../Model/Store/Actions/InfoAction.dart';

class CadetInfo extends StatefulWidget {
  const CadetInfo({Key? key}) : super(key: key);

  @override
  _CadetInfoState createState() => _CadetInfoState();
}

class _CadetInfoState extends State<CadetInfo> {
  String buildingSelection = 'SIJAN';
  TextEditingController roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, ViewModel<User>>(
      converter: (store) =>
          ViewModel<User>(store: store, content: store.state.user),
      builder: (context, model) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              InputBlock(
                label: "Name",
                disabled: true,
                initial: model.content.personal_info.full_name,
                onSubmit: (input) {},
              ),
              const SizedBox(height: 20),
              InputBlock(
                label: "Phone Number",
                onSubmit: (value) => model.dispatch(InfoAction(
                    modify: (b) => b..personal_info.phone_number = value)),
                validator: (String? value) => (value ?? "").length < 10
                    ? "Phone number must have at least ten characters"
                    : null,
                hint: "(123) 456-789",
                initial: model.content.personal_info.phone_number,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: buildingSelection,
                      onChanged: (String? newValue) {
                        setState(() {
                          buildingSelection = newValue ?? 'SIJAN';
                          if (buildingSelection == 'AWAY') {
                            roomController.clear();
                            model.dispatch(InfoAction(
                                modify: (b) => b..personal_info.room_number = 'AWAY'));
                          }
                        });
                      },
                      items: <String>['SIJAN', 'VANDY', 'AWAY']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InputBlock(
                      controller: roomController,
                      label: "Room Number",
                      disabled: buildingSelection == 'AWAY',
                      onSubmit: (value) {
                        if (buildingSelection != 'AWAY') {
                          model.dispatch(InfoAction(
                              modify: (b) => b..personal_info.room_number =
                                  '$buildingSelection ${value?.trim().toUpperCase()}'));
                        }
                      },
                      initial: model.content.personal_info.room_number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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

class InputBlock extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?) onSubmit;
  final String? Function(String?)? validator;
  final String? hint;
  final String? initial;
  final String? label;
  final bool disabled;

  const InputBlock({
    Key? key,
    this.controller,
    required this.onSubmit,
    this.validator,
    this.hint,
    this.initial,
    this.label,
    this.disabled = false,
  }) : super(key: key);

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
    controller = widget.controller ?? TextEditingController(text: widget.initial);
    value = widget.initial;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focused) {
          if (!focused) {
            widget.onSubmit(controller.text);
          }
          setState(() => selected = focused);
        },
        child: TextField(
          readOnly: widget.disabled,
          controller: controller,
          onChanged: (change) => setState(() => value = change),
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            errorText: widget.validator?.call(value),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).errorColor,
              ),
            ),
            border: OutlineInputBorder(),
            filled: !selected || widget.disabled,
            fillColor: widget.disabled
                ? Theme.of(context).disabledColor
                : Theme.of(context).highlightColor,
          ),
        ),
      ),
    );
  }
}
