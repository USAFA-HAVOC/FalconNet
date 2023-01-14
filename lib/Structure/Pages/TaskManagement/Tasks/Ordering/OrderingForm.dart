import 'package:falcon_net/Utility/InputValidation.dart';
import 'package:flutter/material.dart';

import 'Order.dart';

///Simple form for updating a mitches meals order
///Two fields and a submission button
class OrderingForm extends StatefulWidget {
  final Order? order;
  final void Function(Order)? onSubmit;
  final void Function()? onCancel;

  const OrderingForm({super.key, this.order, this.onSubmit, this.onCancel});

  @override
  State<OrderingForm> createState() => OrderingFormState();
}

class OrderingFormState extends State<OrderingForm> {
  final key = GlobalKey<FormState>();

  late TextEditingController regular;
  late TextEditingController vegetarian;

  @override
  void initState() {
    super.initState();
    regular = TextEditingController(text:widget.order?.regular.toString());
    vegetarian = TextEditingController(text: widget.order?.vegetarian .toString());
  }

  ///Formats and returns an order object based on field information
  ///Requires form validation
  Order formatOrder() {
    return Order(
      regular: regular.text.isEmpty ? 0 : int.parse(regular.text),
      vegetarian: vegetarian.text.isEmpty ? 0 : int.parse(vegetarian.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: regular,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Regular Meals"
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: InputValidation.optionalNumber(),
              ),

              TextFormField(
                controller: vegetarian,
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    labelText: "Vegetarian Meals"
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: InputValidation.optionalNumber(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {

                          //If form entries are valid, call submission closure with formatted pass
                          if (key.currentState!.validate()) {
                            if (widget.onSubmit != null) {
                              widget.onSubmit!(formatOrder());
                            }
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: const Text('Submit'),
                        ),
                      ),
                    ),
                  ),

                  Spacer(flex: 1),

                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                      ),

                      onPressed: () {
                        if (widget.onCancel != null) widget.onCancel!();
                      },

                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}