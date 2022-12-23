import 'package:badges/badges.dart';
import 'package:falcon_net/Model/StateAction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';
import 'package:falcon_net/Model/GlobalState.dart';
import '../Shared/TapIcon.dart';
import 'FNNotifications.dart';

class FNNavigationBar extends StatelessWidget {
  const FNNavigationBar({super.key});

  @override
  Widget build(BuildContext ctx) {
    return LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: TapIcon(
                        Icons.menu,
                        color: Colors.black,
                        onTap: () {
                          print("navigate to menu");
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    )
                )
            ),
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("navigate to home");
                    context.go("/");
                  },
                  child: Image.asset(
                    "aflogo.png",
                    height: 50,
                  ),
                )
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: StoreBuilder<GlobalState>(
                                builder: (context, store) {
                                  if (store.state.notifications.length > 0) {
                                    return GestureDetector(
                                      onTap: () {
                                        print("Navigate to notifications");
                                        showPopover(
                                          context: context,
                                          width: constraints.maxWidth / 2,
                                          height: store.state.notifications.length * 50,
                                          onPop: () {
                                            store.dispatch(StateAction.dismissAll());
                                          },
                                          bodyBuilder: (context) => FNNotifications(
                                            notifications: store.state.notifications,
                                            onClick: (notification) {
                                              store.dispatch(StateAction.dismiss(notification: notification));
                                            },
                                          ),
                                        );
                                      },
                                      child: Badge(
                                        badgeContent: Text(store.state.notifications.length.toString()),
                                        badgeColor: Theme.of(context).indicatorColor,
                                        position: BadgePosition.topEnd(end: 10),
                                        child: Icon(Icons.notifications),
                                      ),
                                    );
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      print("Implement negative feedback");
                                    },
                                    child: Icon(Icons.notifications),
                                  );
                                }
                              )
                          ),
                          Expanded(
                              child: TapIcon(Icons.person_outline_rounded, onTap: () {
                                print("navigate to profile");
                                context.go("/profile");
                              })
                          ),
                        ]
                    )
                  ],
                )
            ),
          ],
        )
    );
  }
}