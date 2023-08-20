import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserEventStatus.dart';
import 'UserStatus.dart';

part 'UserSummary.g.dart';

abstract class UserSummary implements Built<UserSummary, UserSummaryBuilder> {
  static Serializer<UserSummary> get serializer => _$userSummarySerializer;

  String get user_id;
  String get name;
  UserEventStatus get status;


  UserSummary sign() =>
      rebuild((u) => u
          ..status = (UserEventStatusBuilder()..status = UserStatus.signed.name)
      );

  UserSummary._();
  factory UserSummary([void Function(UserSummaryBuilder) updates]) = _$UserSummary;
}