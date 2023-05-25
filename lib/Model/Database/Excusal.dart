import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Excusal.g.dart';

enum ExcusalType {
  sca,
  los,
  ic_status,
  gr,
  bedrest,
  other
}

abstract class Excusal implements Built<Excusal, ExcusalBuilder> {
  static Serializer<Excusal> get serializer => _$excusalSerializer;

  String get type;
  String get sca_number;
  String get other_description;

  Excusal._();
  factory Excusal([void Function(ExcusalBuilder) updates]) = _$Excusal;
}

abstract class EventExcusal implements Built<EventExcusal, EventExcusalBuilder> {
  static Serializer<EventExcusal> get serializer => _$eventExcusalSerializer;

  String? get id;
  String get user_id;
  String get event_id;
  Excusal get excusal;

  EventExcusal._();
  factory EventExcusal([void Function(EventExcusalBuilder) updates]) = _$EventExcusal;
}

abstract class RecurringExcusal implements Built<RecurringExcusal, RecurringExcusalBuilder> {
  static Serializer<RecurringExcusal> get serializer => _$recurringExcusalSerializer;

  String? get id;
  String get user_id;
  String get event_type;
  Excusal get excusal;

  RecurringExcusal._();
  factory RecurringExcusal([void Function(RecurringExcusalBuilder) updates]) = _$RecurringExcusal;
}