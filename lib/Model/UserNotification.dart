import 'package:falcon_net/Model/GlobalState.dart';

class UserNotification implements StateObject {
  final String message;
  final String destination;

  const UserNotification({required this.message, required this.destination});

  @override modified(String key, dynamic value) {
    switch (key) {
      case "message": {
        return UserNotification(message: value, destination: destination);
      }
      case "destination": {
        return UserNotification(message: message, destination: value);
      }
      default: {
        assert(false, "No such prperty");
        return UserNotification(message: message, destination: destination);
      }
    }
  }
}