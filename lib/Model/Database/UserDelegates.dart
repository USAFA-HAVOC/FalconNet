import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';


part 'UserDelegates.g.dart';

abstract class UserDelegates implements Built<UserDelegates, UserDelegatesBuilder> {
  static Serializer<UserDelegates> get serializer => _$userDelegatesSerializer;

  String get user_id;
  String get name;
  int? get class_year_idx;
  String get assigned_unit;
  BuiltList<String> get units;
  BuiltList<TimedRole> get roles;

  UserDelegates._();
  factory UserDelegates([Function(UserDelegatesBuilder) updates]) = _$UserDelegates;
}
