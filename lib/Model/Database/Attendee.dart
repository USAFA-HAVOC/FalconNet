import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Attendee.g.dart';

enum AttendeeType {
  unit,
  list
}

abstract class Attendee implements Built<Attendee, AttendeeBuilder> {
  static Serializer<Attendee> get serializer => _$attendeeSerializer;

  String get type;
  BuiltList<bool>? get class_years;
  BuiltList<String>? get users;

  Attendee._();
  factory Attendee([void Function(AttendeeBuilder) updates]) = _$Attendee;
}