import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'User.dart';

part 'UserList.g.dart';

abstract class UserList implements Built<UserList, UserListBuilder> {
  static Serializer<UserList> get serializer => _$userListSerializer;

  BuiltList<User> get users;

  UserList._();
  factory UserList([void Function(UserListBuilder) updates]) = _$UserList;
}