import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserEvent.dart';
import 'UserStatus.dart';

part 'UserSummary.g.dart';

abstract class UserSummary implements Built<UserSummary, UserSummaryBuilder> {
  static Serializer<UserSummary> get serializer => _$userSummarySerializer;

  String get user_id;
  String get name;
  String? get room;
  BuiltList<UserEvent> get events;

  UserStatus status({String? event}) => UserStatusNames.parse(events.firstWhere((e) => e.event_id == event).status);

  UserSummary sign({String? event}) =>
      rebuild((u) => u
          ..events = (
              events.where((e) => e.event_id != event).toList() +
              events.where((e) => e.event_id == event).map((e) => e.rebuild((e) => e..status = UserStatus.signed.name)).toList()
          ).build().toBuilder()
      );

  UserSummary._();
  factory UserSummary([void Function(UserSummaryBuilder) updates]) = _$UserSummary;
}