import 'package:async_redux/async_redux.dart';
import 'package:badges/badges.dart';
import 'package:falcon_net/Model/Data/UserNotification.dart';
import 'package:falcon_net/Structure/Components/ViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import '../Model/Store/Actions/NotificationAction.dart';
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Expanded(
                child: Container(
                  alignment: AlignmentDirectional.bottomStart,

                  //Set to opaque in order to capture taps on invisible padding
                  //Otherwise, will only capture taps directly on icon
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(25),

                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ),



            Expanded(

              //Navigates to home
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,

                  onTap: () {
                    context.go("/");
                  },

                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      "assets/images/aflogo.png",
                      height: 60,
                    ),

                  )
              ),
            ),

            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: StoreConnector<GlobalState, ViewModel<List<UserNotification>>>(
                              converter: (store) => ViewModel<List<UserNotification>>(store: store, content: store.state.notifications),
                              builder: (context, model) {
                                //If there are notifications display a badge icon
                                if (model.content.isNotEmpty) {
                                  return GestureDetector(

                                    behavior: HitTestBehavior.opaque,

                                    onTap: () {

                                      //On tap, display a popover under the notification icon
                                      showPopover(
                                        context: context,
                                        width: constraints.maxWidth / 2,
                                        height: model.content.length * 50,

                                        //On closing, dispatch dismiss all action
                                        onPop: () {
                                          model.dispatch(NotificationAction.dismissAll());
                                        },

                                        //Display FNNotifications in popover
                                        bodyBuilder: (context) => FNNotifications(
                                          notifications: model.content,

                                          //On click, dispatch dismiss action
                                          onClick: (notification) {
                                            model.dispatch(NotificationAction.dismiss(notification));
                                          },
                                        ),
                                      );
                                    },

                                    //Badge icon containing number of notifications
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 25),
                                      child: Badge(
                                        badgeContent: Text(model.content.length.toString()),
                                        badgeColor: Theme.of(context).indicatorColor,
                                        position: BadgePosition.topEnd(end: 10),
                                        child: Icon(Icons.notifications),
                                      ),
                                    ),
                                  );
                                }

                                //If no notifications, don't include badge
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,

                                  //Can't open notifications, so execute haptic feedback
                                  onTap: () {
                                    HapticFeedback.mediumImpact();
                                  },

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 25),
                                    child: Icon(Icons.notifications),
                                  ),
                                );
                              }
                          )
                      ),

                      Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => context.go("/profile"),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Icon(Icons.person_rounded),
                            ),
                          )
                      ),
                    ]
                ),
            ),
          ],
        )
    );
  }
}