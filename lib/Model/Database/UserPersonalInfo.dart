import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserPersonalInfo.g.dart';

abstract class UserPersonalInfo implements Built<UserPersonalInfo, UserPersonalInfoBuilder> {
  static Serializer<UserPersonalInfo> get serializer => _$userPersonalInfoSerializer;

  String get email;
  String get full_name;
  String? get phone_number;
  String? get room_number;

  UserPersonalInfo._();
  factory UserPersonalInfo([void Function(UserPersonalInfoBuilder) updates]) = _$UserPersonalInfo;
}
