import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SchedulingEvent.g.dart';

abstract class SchedulingEvent implements Built<SchedulingEvent, SchedulingEventBuilder> {
  static Serializer<SchedulingEvent> get serializer => _$schedulingEventSerializer;

  String get id;
  DateTime get time;
  String? get payload;

  SchedulingEvent._();
  factory SchedulingEvent([void Function(SchedulingEventBuilder) updates]) = _$SchedulingEvent;
}