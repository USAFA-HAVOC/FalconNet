import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'UserDelegates.dart';

part 'UserDelegatesList.g.dart';

abstract class UserDelegatesList implements Built<UserDelegatesList, UserDelegatesListBuilder> {
  static Serializer<UserDelegatesList> get serializer => _$userDelegatesListSerializer;

  BuiltList<UserDelegates> get users;

  UserDelegatesList._();
  factory UserDelegatesList([Function(UserDelegatesListBuilder) updates]) = _$UserDelegatesList;
}
