import 'package:falcon_net/Model/Store/GlobalState.dart';

class UserNotification {
  String message;
  String destination;

  UserNotification({required this.message, required this.destination});

  UserNotification.fromString(String text) :
    message = text.split("?")[0],
    destination = text.split("?")[1];

  String stringify() => "$message?$destination";
}