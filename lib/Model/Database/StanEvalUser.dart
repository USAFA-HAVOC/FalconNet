import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserEventStatus.dart';
import 'UserStatus.dart';

part 'StanEvalUser.g.dart';

abstract class StanEvalUser implements Built<StanEvalUser, StanEvalUserBuilder> {
  static Serializer<StanEvalUser> get serializer => _$stanEvalUserSerializer;

  String get user_id;
  String get name;
  String? get room;

  StanEvalUser._();
  factory StanEvalUser([void Function(StanEvalUserBuilder) updates]) = _$StanEvalUser;
}