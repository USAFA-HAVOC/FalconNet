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
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
      'submission_deadline',
      serializers.serialize(object.submission_deadline,
          specifiedType: const FullType(DateTime)),
      'submission_start',
      serializers.serialize(object.submission_start,
          specifiedType: const FullType(DateTime)),
      'accountability_method',
      serializers.serialize(object.accountability_method,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signature_name;
    if (value != null) {
      result
        ..add('signature_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signature_user_id;
    if (value != null) {
      result
        ..add('signature_user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signature_time;
    if (value != null) {
      result
        ..add('signature_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'submission_deadline':
          result.submission_deadline = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'submission_start':
          result.submission_start = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'accountability_method':
          result.accountability_method = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signature_name':
          result.signature_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'signature_user_id':
          result.signature_user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'signature_time':
          result.signature_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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
  final String? name;
  @override
  final String? description;
  @override
  final DateTime time;
  @override
  final DateTime submission_deadline;
  @override
  final DateTime submission_start;
  @override
  final String accountability_method;
  @override
  final String type;
  @override
  final String status;
  @override
  final String? signature_name;
  @override
  final String? signature_user_id;
  @override
  final DateTime? signature_time;

  factory _$UserEvent([void Function(UserEventBuilder)? updates]) =>
      (new UserEventBuilder()..update(updates))._build();

  _$UserEvent._(
      {required this.event_id,
      this.name,
      this.description,
      required this.time,
      required this.submission_deadline,
      required this.submission_start,
      required this.accountability_method,
      required this.type,
      required this.status,
      this.signature_name,
      this.signature_user_id,
      this.signature_time})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(event_id, r'UserEvent', 'event_id');
    BuiltValueNullFieldError.checkNotNull(time, r'UserEvent', 'time');
    BuiltValueNullFieldError.checkNotNull(
        submission_deadline, r'UserEvent', 'submission_deadline');
    BuiltValueNullFieldError.checkNotNull(
        submission_start, r'UserEvent', 'submission_start');
    BuiltValueNullFieldError.checkNotNull(
        accountability_method, r'UserEvent', 'accountability_method');
    BuiltValueNullFieldError.checkNotNull(type, r'UserEvent', 'type');
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
        submission_deadline == other.submission_deadline &&
        submission_start == other.submission_start &&
        accountability_method == other.accountability_method &&
        type == other.type &&
        status == other.status &&
        signature_name == other.signature_name &&
        signature_user_id == other.signature_user_id &&
        signature_time == other.signature_time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, submission_deadline.hashCode);
    _$hash = $jc(_$hash, submission_start.hashCode);
    _$hash = $jc(_$hash, accountability_method.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, signature_name.hashCode);
    _$hash = $jc(_$hash, signature_user_id.hashCode);
    _$hash = $jc(_$hash, signature_time.hashCode);
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
          ..add('submission_deadline', submission_deadline)
          ..add('submission_start', submission_start)
          ..add('accountability_method', accountability_method)
          ..add('type', type)
          ..add('status', status)
          ..add('signature_name', signature_name)
          ..add('signature_user_id', signature_user_id)
          ..add('signature_time', signature_time))
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

  DateTime? _submission_deadline;
  DateTime? get submission_deadline => _$this._submission_deadline;
  set submission_deadline(DateTime? submission_deadline) =>
      _$this._submission_deadline = submission_deadline;

  DateTime? _submission_start;
  DateTime? get submission_start => _$this._submission_start;
  set submission_start(DateTime? submission_start) =>
      _$this._submission_start = submission_start;

  String? _accountability_method;
  String? get accountability_method => _$this._accountability_method;
  set accountability_method(String? accountability_method) =>
      _$this._accountability_method = accountability_method;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _signature_name;
  String? get signature_name => _$this._signature_name;
  set signature_name(String? signature_name) =>
      _$this._signature_name = signature_name;

  String? _signature_user_id;
  String? get signature_user_id => _$this._signature_user_id;
  set signature_user_id(String? signature_user_id) =>
      _$this._signature_user_id = signature_user_id;

  DateTime? _signature_time;
  DateTime? get signature_time => _$this._signature_time;
  set signature_time(DateTime? signature_time) =>
      _$this._signature_time = signature_time;

  UserEventBuilder();

  UserEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event_id = $v.event_id;
      _name = $v.name;
      _description = $v.description;
      _time = $v.time;
      _submission_deadline = $v.submission_deadline;
      _submission_start = $v.submission_start;
      _accountability_method = $v.accountability_method;
      _type = $v.type;
      _status = $v.status;
      _signature_name = $v.signature_name;
      _signature_user_id = $v.signature_user_id;
      _signature_time = $v.signature_time;
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
            name: name,
            description: description,
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'UserEvent', 'time'),
            submission_deadline: BuiltValueNullFieldError.checkNotNull(
                submission_deadline, r'UserEvent', 'submission_deadline'),
            submission_start: BuiltValueNullFieldError.checkNotNull(
                submission_start, r'UserEvent', 'submission_start'),
            accountability_method: BuiltValueNullFieldError.checkNotNull(
                accountability_method, r'UserEvent', 'accountability_method'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'UserEvent', 'type'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'UserEvent', 'status'),
            signature_name: signature_name,
            signature_user_id: signature_user_id,
            signature_time: signature_time);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
