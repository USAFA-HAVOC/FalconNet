import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserSummary.dart';

part 'UserSummaryList.g.dart';

abstract class UserSummaryList implements Built<UserSummaryList, UserSummaryListBuilder> {
  static Serializer<UserSummaryList> get serializer => _$userSummaryListSerializer;

  BuiltList<UserSummary> get users;

  UserSummaryList._();
  factory UserSummaryList([void Function(UserSummaryListBuilder) updates]) = _$UserSummaryList;
}