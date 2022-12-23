import 'package:falcon_net/Model/GlobalState.dart';

class UserNotification implements StateObject {
  final String message;
  final String destination;

  const UserNotification({required this.message, required this.destination});

  @override modified(Enum k, dynamic value) {
    UserNotificationProperty key = k as UserNotificationProperty;
    switch (key) {
      case UserNotificationProperty.message: {
        return UserNotification(message: value, destination: destination);
      }
      case UserNotificationProperty.destination: {
        return UserNotification(message: message, destination: value);
      }
    }
  }
}

enum UserNotificationProperty {
  message,
  destination,
}