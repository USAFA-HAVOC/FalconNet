import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'TimedRole.g.dart';

abstract class TimedRole implements Built<TimedRole, TimedRoleBuilder> {
  static Serializer<TimedRole> get serializer => _$timedRoleSerializer;

  String get role;
  DateTime get start;
  DateTime get end;

  TimedRole._();
  factory TimedRole([void Function(TimedRoleBuilder) updates]) = _$TimedRole;
}