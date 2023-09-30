// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchedulingEvent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SchedulingEvent> _$schedulingEventSerializer =
    new _$SchedulingEventSerializer();

class _$SchedulingEventSerializer
    implements StructuredSerializer<SchedulingEvent> {
  @override
  final Iterable<Type> types = const [SchedulingEvent, _$SchedulingEvent];
  @override
  final String wireName = 'SchedulingEvent';

  @override
  Iterable<Object?> serialize(Serializers serializers, SchedulingEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.payload;
    if (value != null) {
      result
        ..add('payload')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SchedulingEvent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SchedulingEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'payload':
          result.payload = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SchedulingEvent extends SchedulingEvent {
  @override
  final String id;
  @override
  final DateTime time;
  @override
  final String? payload;

  factory _$SchedulingEvent([void Function(SchedulingEventBuilder)? updates]) =>
      (new SchedulingEventBuilder()..update(updates))._build();

  _$SchedulingEvent._({required this.id, required this.time, this.payload})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SchedulingEvent', 'id');
    BuiltValueNullFieldError.checkNotNull(time, r'SchedulingEvent', 'time');
  }

  @override
  SchedulingEvent rebuild(void Function(SchedulingEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchedulingEventBuilder toBuilder() =>
      new SchedulingEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SchedulingEvent &&
        id == other.id &&
        time == other.time &&
        payload == other.payload;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, payload.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SchedulingEvent')
          ..add('id', id)
          ..add('time', time)
          ..add('payload', payload))
        .toString();
  }
}

class SchedulingEventBuilder
    implements Builder<SchedulingEvent, SchedulingEventBuilder> {
  _$SchedulingEvent? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  String? _payload;
  String? get payload => _$this._payload;
  set payload(String? payload) => _$this._payload = payload;

  SchedulingEventBuilder();

  SchedulingEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _time = $v.time;
      _payload = $v.payload;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SchedulingEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SchedulingEvent;
  }

  @override
  void update(void Function(SchedulingEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SchedulingEvent build() => _build();

  _$SchedulingEvent _build() {
    final _$result = _$v ??
        new _$SchedulingEvent._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SchedulingEvent', 'id'),
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'SchedulingEvent', 'time'),
            payload: payload);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
