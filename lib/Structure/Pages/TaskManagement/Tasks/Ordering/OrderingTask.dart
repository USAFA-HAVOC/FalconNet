import 'package:falcon_net/Structure/Components/PageWidget.dart';
import 'package:falcon_net/Structure/Pages/TaskManagement/Tasks/Ordering/OrderingForm.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Model/Data/Order.dart';

///Applet for submitting Q&I / Bedrest meal orders
///Seperated from rest of app
///Performs own api calls
class OrderingTask extends StatefulWidget {
  const OrderingTask({super.key});

  @override
  State<OrderingTask> createState() => OrderingTaskState();
}

class OrderingTaskState extends State<OrderingTask> {
  late Future<Order> future;

  @override
  void initState() {
    super.initState();
    future = fetchOrder();
  }

  Future<Order> fetchOrder() {
    //api call
    return Future<Order>.delayed(Duration(seconds: 1), () => Order(regular: 5, vegetarian: 3));
  }

  Future<bool> submitOrder(Order order) {
    //api call
    var result = true;
    return Future<bool>.delayed(Duration(seconds: 1), () => result);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                    "Ordering",
                    style: Theme.of(context).textTheme.titleLarge
                ),
              ),

              //Builds and updates content as future loads
              FutureBuilder<Order>(
                  future: future,
                  initialData: null,
                  builder: (context, snapshot) {

                    //Retrieve the scaffold messenger to display snack bar later
                    var messenger = ScaffoldMessenger.of(context);

                    var order = snapshot.data;

                    if (order == null) {
                      return PageWidget(
                          title: "Current Order",

                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: SizedBox(width: double.infinity, height: 100,),
                              ),
                            )
                          ]
                      );
                    }

                    else {
                      return PageWidget(
                        title: "Current Order",
                        children: [
                          Text("Regular Meals: ${order.regular}"),

                          Text("Vegetarian Meals: ${order.vegetarian}"),

                          ElevatedButton(
                            onPressed: () => showDialog(context: context, builder: (context) => Dialog(
                              child: Padding(
                                padding: EdgeInsets.all(10),
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
                                      future = Future<Order>.value(change);
                                    });

                                    submitOrder(change).then((result) {

                                      //If order wasn't sucessfully submitted
                                      if (!result) {
                                        messenger.showSnackBar(SnackBar(
                                            content: Text("Order failed to submit"),
                                        ));

                                        setState(() {
                                          future = Future<Order>.value(previous);
                                        });
                                      }
                                    });

                                    Navigator.of(context).pop();
                                  },

                                  onCancel: () => Navigator.of(context).pop(),
                                ),
                              ),
                            )),

                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text('Update'),
                            ),
                          )
                        ],
                      );
                    }
                  }
              ),
            ],
          ),
        )
      ],
    );
  }
}