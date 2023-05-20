import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserEvent.g.dart';

abstract class UserEvent implements Built<UserEvent, UserEventBuilder> {
  static Serializer<UserEvent> get serializer => _$userEventSerializer;

  String get event_id;
  String get name;
  String? get description;
  DateTime get time;
  String get accountability_method;
  String get status;

  UserEvent._();
  factory UserEvent([void Function(UserEventBuilder) updates]) = _$UserEvent;
}