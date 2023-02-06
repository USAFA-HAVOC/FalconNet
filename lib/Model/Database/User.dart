import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'CadetDI.dart';
import 'CadetPassAllocation.dart';
import 'UserPersonalInfo.dart';


part 'User.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String? get id;
  UserPersonalInfo get personal_info;
  CadetPassAllocation? get pass_allocation;
  CadetDI? get di;
  DateTime? get last_login;
  BuiltList<String> get roles;

  User._();
  factory User([Function(UserBuilder) updates]) = _$User;
}
