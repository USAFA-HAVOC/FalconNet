import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserEventExcusal.dart';


part 'UserEventStatus.g.dart';


abstract class UserEventStatus implements Built<UserEventStatus, UserEventStatusBuilder> {
  static Serializer<UserEventStatus> get serializer => _$userEventStatusSerializer;

  String get status;
  DateTime? get returning;
  String? get signature_user_id;
  String? get signature_name;
  DateTime? get signature_time;
  UserEventExcusal? get excusal;

  UserEventStatus._();
  factory UserEventStatus([void Function(UserEventStatusBuilder) updates]) = _$UserEventStatus;
}