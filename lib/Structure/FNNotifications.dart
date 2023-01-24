import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Notification widget contained in popover
class FNNotifications extends StatelessWidget {
  final List<UserNotification> notifications;
  final void Function(UserNotification)? onClick;

  const FNNotifications({super.key, required this.notifications, this.onClick});

  @override build(BuildContext context) {

    //Maps each notification to a notification bar
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: notifications.map((notification) => NotificationBar(
        notification: notification,
        onClick: onClick,
      )).toList(),
    );
  }
}

///A Notification bar contained in the notifications widget
///Navigates to the notifications destination on use interaction
///Essentially text contained within a decorated box
class NotificationBar extends StatelessWidget {
  final UserNotification notification;
  final void Function(UserNotification)? onClick;

  const NotificationBar({super.key, required this.notification, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      //Calls the on click function, usually used to navigate to another page
      onTap: () {
        Navigator.of(context).pop();
        context.go(notification.destination);
        if (onClick != null) {
          onClick!(notification);
        }
      },

      //Important: Constrained box is required to prevent size overflow and match to notification widget height
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 50),
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                )
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      notification.message,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}