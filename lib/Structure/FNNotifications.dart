import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

import '../Model/GlobalState.dart';
import '../Model/UserNotification.dart';

class FNNotifications extends StatelessWidget {
  final List<UserNotification> notifications;
  final void Function(UserNotification)? onClick;

  const FNNotifications({super.key, required this.notifications, this.onClick});

  @override build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: notifications.map((notification) => NotificationBar(
        notification: notification,
        onClick: onClick,
      )).toList(),
    );
  }
}

class NotificationBar extends StatelessWidget {
  final UserNotification notification;
  final void Function(UserNotification)? onClick;

  const NotificationBar({super.key, required this.notification, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        context.go(notification.destination);
        if (onClick != null) {
          onClick!(notification);
        }
      },
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