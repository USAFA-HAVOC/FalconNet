import 'package:falcon_net/Model/Store/GlobalState.dart';

class UserNotification {
  final String message;
  final String destination;

  const UserNotification({required this.message, required this.destination});
}