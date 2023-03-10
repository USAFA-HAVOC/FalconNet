import 'package:falcon_net/Structure/Components/LoadingShimmer.dart';
import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Ordering/OrderingForm.dart';
import 'package:flutter/material.dart';

import '../../../../../Model/Database/UnitOrder.dart';
import '../../../../Components/FNPage.dart';

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
    return FutureBuilder<UnitOrder>(
        future: future,
        initialData: null,
        builder: (context, snapshot) {
          //Retrieve the scaffold messenger to display snack bar later
          var messenger = ScaffoldMessenger.of(context);
          var order = snapshot.data;

          Widget child;

          if (order == null) {
            child = const LoadingShimmer();
          }

          else {
            child = PageWidget(
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

                            //If order wasn't sucessfully submitted
                            if (!result) {
                              messenger.showSnackBar(const SnackBar(
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
            );
          }

          return FNPage(
              title: "Ordering",
              children: [
                child
              ]
          );
        }
    );
  }
}