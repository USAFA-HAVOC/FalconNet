import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserEventExcusal.g.dart';

abstract class UserEventExcusal implements Built<UserEventExcusal, UserEventExcusalBuilder> {
  static Serializer<UserEventExcusal> get serializer => _$userEventExcusalSerializer;

  String get type;
  String? get number;
  String? get other_description;

  UserEventExcusal._();
  factory UserEventExcusal([void Function(UserEventExcusalBuilder) updates]) = _$UserEventExcusal;
}