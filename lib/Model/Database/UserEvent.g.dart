// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEvent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserEvent> _$userEventSerializer = new _$UserEventSerializer();

class _$UserEventSerializer implements StructuredSerializer<UserEvent> {
  @override
  final Iterable<Type> types = const [UserEvent, _$UserEvent];
  @override
  final String wireName = 'UserEvent';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'event_id',
      serializers.serialize(object.event_id,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
      'accountability_method',
      serializers.serialize(object.accountability_method,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserEvent deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event_id':
          result.event_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'accountability_method':
          result.accountability_method = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserEvent extends UserEvent {
  @override
  final String event_id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime time;
  @override
  final String accountability_method;
  @override
  final String status;

  factory _$UserEvent([void Function(UserEventBuilder)? updates]) =>
      (new UserEventBuilder()..update(updates))._build();

  _$UserEvent._(
      {required this.event_id,
      required this.name,
      this.description,
      required this.time,
      required this.accountability_method,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(event_id, r'UserEvent', 'event_id');
    BuiltValueNullFieldError.checkNotNull(name, r'UserEvent', 'name');
    BuiltValueNullFieldError.checkNotNull(time, r'UserEvent', 'time');
    BuiltValueNullFieldError.checkNotNull(
        accountability_method, r'UserEvent', 'accountability_method');
    BuiltValueNullFieldError.checkNotNull(status, r'UserEvent', 'status');
  }

  @override
  UserEvent rebuild(void Function(UserEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEventBuilder toBuilder() => new UserEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEvent &&
        event_id == other.event_id &&
        name == other.name &&
        description == other.description &&
        time == other.time &&
        accountability_method == other.accountability_method &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, accountability_method.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserEvent')
          ..add('event_id', event_id)
          ..add('name', name)
          ..add('description', description)
          ..add('time', time)
          ..add('accountability_method', accountability_method)
          ..add('status', status))
        .toString();
  }
}

class UserEventBuilder implements Builder<UserEvent, UserEventBuilder> {
  _$UserEvent? _$v;

  String? _event_id;
  String? get event_id => _$this._event_id;
  set event_id(String? event_id) => _$this._event_id = event_id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  String? _accountability_method;
  String? get accountability_method => _$this._accountability_method;
  set accountability_method(String? accountability_method) =>
      _$this._accountability_method = accountability_method;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  UserEventBuilder();

  UserEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event_id = $v.event_id;
      _name = $v.name;
      _description = $v.description;
      _time = $v.time;
      _accountability_method = $v.accountability_method;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserEvent;
  }

  @override
  void update(void Function(UserEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserEvent build() => _build();

  _$UserEvent _build() {
    final _$result = _$v ??
        new _$UserEvent._(
            event_id: BuiltValueNullFieldError.checkNotNull(
                event_id, r'UserEvent', 'event_id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UserEvent', 'name'),
            description: description,
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'UserEvent', 'time'),
            accountability_method: BuiltValueNullFieldError.checkNotNull(
                accountability_method, r'UserEvent', 'accountability_method'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'UserEvent', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
