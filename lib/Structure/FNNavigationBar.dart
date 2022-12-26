import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import '../Model/Store/StateAction.dart';
import 'Components/TapIcon.dart';
import 'FNNotifications.dart';

///Overhead navigation bar
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

                        //Opens the side menu
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    )
                )
            ),

            Expanded(

              //Navigates to home
              child: GestureDetector(
                onTap: () {
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

                                  //If there are notifications display a badge icon
                                  if (store.state.notifications.length > 0) {
                                    return GestureDetector(
                                      onTap: () {

                                        //On tap, display a popover under the notification icon
                                        showPopover(
                                          context: context,
                                          width: constraints.maxWidth / 2,
                                          height: store.state.notifications.length * 50,

                                          //On closing, dispatch dismiss all action
                                          onPop: () {
                                            store.dispatch(StateAction.dismissAll());
                                          },

                                          //Display FNNotifications in popover
                                          bodyBuilder: (context) => FNNotifications(
                                            notifications: store.state.notifications,

                                            //On click, dispatch dismiss action
                                            onClick: (notification) {
                                              store.dispatch(StateAction.dismiss(notification: notification));
                                            },
                                          ),
                                        );
                                      },

                                      //Badge icon containing number of notifications
                                      child: Badge(
                                        badgeContent: Text(store.state.notifications.length.toString()),
                                        badgeColor: Theme.of(context).indicatorColor,
                                        position: BadgePosition.topEnd(end: 10),
                                        child: Icon(Icons.notifications),
                                      ),
                                    );
                                  }

                                  //If no notifications, don't include badge
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