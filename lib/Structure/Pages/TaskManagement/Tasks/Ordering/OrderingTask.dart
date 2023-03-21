import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Ordering/OrderingForm.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitOrder.dart';
import '../../../../Components/AsyncPage.dart';

///Applet for submitting Q&I / Bedrest meal orders
class OrderingTask extends StatefulWidget {
  const OrderingTask({super.key});

  @override
  State<OrderingTask> createState() => OrderingTaskState();
}

class OrderingTaskState extends State<OrderingTask> {
  late Future<UnitOrder> future;

  @override
  void initState() {
    super.initState();
    future = fetchOrder();
  }

  Future<UnitOrder> fetchOrder() {
    /// todo: replace with api call
    return Future<UnitOrder>.delayed(const Duration(seconds: 1), () => UnitOrder((o) => o
        ..regular = 5
        ..vegetarian = 3
    ));
  }

  Future<bool> submitOrder(UnitOrder order) {
    /// todo: replace with api call
    var result = true;
    return Future<bool>.delayed(const Duration(seconds: 1), () => result);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPage(
        title: "Ordering",
        connection: future,
        builder: (context, order) => [
          PageWidget(
            title: "Current Order",
            children: [
              Text("Regular Meals: ${order.regular}"),

              Text("Vegetarian Meals: ${order.vegetarian}"),

              ElevatedButton(
                onPressed: () => showDialog(context: context, builder: (context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: OrderingForm(
                      order: order,

                      /*
                          When an update is submitted, initially update
                          state. Next, make an api call with update and
                          wait for results. If failed, reset order and
                          alert user.
                         */
                      onSubmit: (change) {
                        var previous = order;

                        setState(() {
                          future = Future<UnitOrder>.value(change);
                        });

                        submitOrder(change).then((result) {

                          //If order wasn't successfully submitted
                          if (!result) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Order failed to submit"),
                            ));

                            setState(() {
                              future = Future<UnitOrder>.value(previous);
                            });
                          }
                        });

                        Navigator.of(context).pop();
                      },

                      onCancel: () => Navigator.of(context).pop(),
                    ),
                  ),
                )),

                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Update'),
                ),
              )
            ],
          )
        ]
    );
  }
}