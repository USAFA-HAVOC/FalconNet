import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Excusal.g.dart';

enum ExcusalType {
  sca,
  los,
  ic_status,
  gr,
  bedrest,
  airmanship,
  other
}

extension ExcusalTypeNames on ExcusalType {
  String display() {
    switch (this) {
      case ExcusalType.sca: return "SCA";
      case ExcusalType.los: return "LOS";
      case ExcusalType.ic_status: return "IC Status";
      case ExcusalType.gr: return "GR";
      case ExcusalType.bedrest: return "Bedrest";
      case ExcusalType.airmanship: return "Airmanship";
      case ExcusalType.other: return "Other";
    }
  }

  static ExcusalType parse(String text) =>
      ExcusalType.values.firstWhere((e) => e.name == text);
}

enum RecurringExcusalType {
  all_events,
  m_days,
  t_days,
  days_of_week
}

extension RecurringExcusalTypeNames on RecurringExcusalType {
  String display() {
    switch (this) {
      case RecurringExcusalType.all_events: return "All Days";
      case RecurringExcusalType.m_days: return "M-Days";
      case RecurringExcusalType.t_days: return "T-Days";
      case RecurringExcusalType.days_of_week: return "Days of Week";
    }
  }

  static RecurringExcusalType parse(String text) =>
      RecurringExcusalType.values.firstWhere((e) => e.name == text);
}

abstract class Excusal implements Built<Excusal, ExcusalBuilder> {
  static Serializer<Excusal> get serializer => _$excusalSerializer;

  String get type;
  String? get sca_number;
  String? get other_description;

  Excusal._();
  factory Excusal([void Function(ExcusalBuilder) updates]) = _$Excusal;
}

abstract class ExcusalSpecifier {
  Excusal get excusal;
  String? get id;
}

abstract class EventExcusal implements Built<EventExcusal, EventExcusalBuilder>, ExcusalSpecifier {
  static Serializer<EventExcusal> get serializer => _$eventExcusalSerializer;

  @override
  String? get id;
  String get user_id;
  String get event_id;
  @override
  Excusal get excusal;

  EventExcusal._();
  factory EventExcusal([void Function(EventExcusalBuilder) updates]) = _$EventExcusal;
}

abstract class RecurringExcusal implements Built<RecurringExcusal, RecurringExcusalBuilder>, ExcusalSpecifier {
  static Serializer<RecurringExcusal> get serializer => _$recurringExcusalSerializer;

  @override
  String? get id;
  String get user_id;
  BuiltList<String> get event_types;
  String get recurring_excusal_type;
  BuiltList<bool>? get excused_days;
  @override
  Excusal get excusal;

  RecurringExcusal._();
  factory RecurringExcusal([void Function(RecurringExcusalBuilder) updates]) = _$RecurringExcusal;
}