import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'UserPersonalInfo.g.dart';

abstract class UserPersonalInfo implements Built<UserPersonalInfo, UserPersonalInfoBuilder> {
  static Serializer<UserPersonalInfo> get serializer => _$userPersonalInfoSerializer;

  String get email;
  String get full_name;
  String get phone_number;
  String get room_number;
  int get squadron;
  String get group;
  String get unit;

  UserPersonalInfo._();
  factory UserPersonalInfo([void Function(UserPersonalInfoBuilder) updates]) = _$UserPersonalInfo;
}
