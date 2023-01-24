import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'UserNotification.g.dart';

abstract class UserNotification implements Built<UserNotification, UserNotificationBuilder> {
  static Serializer<UserNotification> get serializer => _$userNotificationSerializer;

  String get message;
  String get destination;

  String stringify() => "$message?$destination";

  static UserNotification fromString(String text) {
    return UserNotification((u) => u..message=text.split("?")[0]..destination=text.split("?")[1]);
  }

  UserNotification._();
  factory UserNotification([void Function(UserNotificationBuilder) updates]) = _$UserNotification;
}
