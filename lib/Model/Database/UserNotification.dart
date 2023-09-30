import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserNotification.g.dart';

abstract class UserNotification implements Built<UserNotification, UserNotificationBuilder> {
  static Serializer<UserNotification> get serializer => _$userNotificationSerializer;

  String get message;
  String get destination;

  UserNotification._();
  factory UserNotification([void Function(UserNotificationBuilder) updates]) = _$UserNotification;
}
