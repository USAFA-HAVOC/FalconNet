import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';

import 'CadetAccountability.dart';
import 'UserPersonalInfo.dart';


part 'User.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String? get id;
  String get ms_oid;
  BuiltList<String> get units;
  String? get assigned_unit;
  UserPersonalInfo get personal_info;
  CadetAccountability? get accountability;
  DateTime? get last_login;
  BuiltList<TimedRole> get roles;

  User._();
  factory User([Function(UserBuilder) updates]) = _$User;
}
