import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Attendee.dart';
import 'UserSummary.dart';

part 'AccountabilityEvent.g.dart';

enum EventType {
  maf,
  mcq,
  nmf,
  di,
  m5,
  ddt,
  other
}

enum AccountabilityMethod {
  squadron_based,
  self_signed,
  di
}

abstract class AccountabilityEvent implements Built<AccountabilityEvent, AccountabilityEventBuilder> {
  static Serializer<AccountabilityEvent> get serializer => _$accountabilityEventSerializer;

  String? get id;
  String get event_type;
  String? get name;
  DateTime get time;
  DateTime get submission_deadline;
  DateTime get submission_start;
  BuiltList<Attendee> get attendees;
  String get accountability_method;

  AccountabilityEvent._();
  factory AccountabilityEvent([void Function(AccountabilityEventBuilder) updates]) = _$AccountabilityEvent;
}

abstract class AccountabilityEventStatus implements Built<AccountabilityEventStatus, AccountabilityEventStatusBuilder> {
  static Serializer<AccountabilityEventStatus> get serializer => _$accountabilityEventStatusSerializer;

  AccountabilityEvent get event;
  BuiltList<UserSummary> get signed;
  BuiltList<UserSummary> get unsigned;
  BuiltList<UserSummary> get excused;

  AccountabilityEventStatus._();
  factory AccountabilityEventStatus([void Function(AccountabilityEventStatusBuilder) updates]) = _$AccountabilityEventStatus;
}

abstract class EventList implements Built<EventList, EventListBuilder> {
  static Serializer<EventList> get serializer => _$eventListSerializer;

  BuiltList<AccountabilityEvent> get events;

  EventList._();
  factory EventList([void Function(EventListBuilder) updates]) = _$EventList;
}