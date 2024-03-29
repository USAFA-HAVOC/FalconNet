// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountabilityEvent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountabilityEvent> _$accountabilityEventSerializer =
    new _$AccountabilityEventSerializer();
Serializer<AccountabilityEventStatus> _$accountabilityEventStatusSerializer =
    new _$AccountabilityEventStatusSerializer();
Serializer<EventList> _$eventListSerializer = new _$EventListSerializer();

class _$AccountabilityEventSerializer
    implements StructuredSerializer<AccountabilityEvent> {
  @override
  final Iterable<Type> types = const [
    AccountabilityEvent,
    _$AccountabilityEvent
  ];
  @override
  final String wireName = 'AccountabilityEvent';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AccountabilityEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
      'submission_deadline',
      serializers.serialize(object.submission_deadline,
          specifiedType: const FullType(DateTime)),
      'submission_start',
      serializers.serialize(object.submission_start,
          specifiedType: const FullType(DateTime)),
      'attending_units',
      serializers.serialize(object.attending_units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'attending_class_years',
      serializers.serialize(object.attending_class_years,
          specifiedType:
              const FullType(BuiltList, const [const FullType(bool)])),
      'attending_users',
      serializers.serialize(object.attending_users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'accountability_method',
      serializers.serialize(object.accountability_method,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    return result;
  }

  @override
  AccountabilityEvent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountabilityEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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
        case 'attending_units':
          result.attending_units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'attending_class_years':
          result.attending_class_years.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'attending_users':
          result.attending_users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'accountability_method':
          result.accountability_method = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountabilityEventStatusSerializer
    implements StructuredSerializer<AccountabilityEventStatus> {
  @override
  final Iterable<Type> types = const [
    AccountabilityEventStatus,
    _$AccountabilityEventStatus
  ];
  @override
  final String wireName = 'AccountabilityEventStatus';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AccountabilityEventStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'event',
      serializers.serialize(object.event,
          specifiedType: const FullType(AccountabilityEvent)),
      'signed',
      serializers.serialize(object.signed,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserSummary)])),
      'unsigned',
      serializers.serialize(object.unsigned,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserSummary)])),
      'excused',
      serializers.serialize(object.excused,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserSummary)])),
    ];

    return result;
  }

  @override
  AccountabilityEventStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountabilityEventStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event':
          result.event.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AccountabilityEvent))!
              as AccountabilityEvent);
          break;
        case 'signed':
          result.signed.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserSummary)]))!
              as BuiltList<Object?>);
          break;
        case 'unsigned':
          result.unsigned.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserSummary)]))!
              as BuiltList<Object?>);
          break;
        case 'excused':
          result.excused.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserSummary)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EventListSerializer implements StructuredSerializer<EventList> {
  @override
  final Iterable<Type> types = const [EventList, _$EventList];
  @override
  final String wireName = 'EventList';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'events',
      serializers.serialize(object.events,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AccountabilityEvent)])),
    ];

    return result;
  }

  @override
  EventList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'events':
          result.events.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AccountabilityEvent)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AccountabilityEvent extends AccountabilityEvent {
  @override
  final String? id;
  @override
  final String type;
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
  final BuiltList<String> attending_units;
  @override
  final BuiltList<bool> attending_class_years;
  @override
  final BuiltList<String> attending_users;
  @override
  final String accountability_method;

  factory _$AccountabilityEvent(
          [void Function(AccountabilityEventBuilder)? updates]) =>
      (new AccountabilityEventBuilder()..update(updates))._build();

  _$AccountabilityEvent._(
      {this.id,
      required this.type,
      this.name,
      this.description,
      required this.time,
      required this.submission_deadline,
      required this.submission_start,
      required this.attending_units,
      required this.attending_class_years,
      required this.attending_users,
      required this.accountability_method})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'AccountabilityEvent', 'type');
    BuiltValueNullFieldError.checkNotNull(time, r'AccountabilityEvent', 'time');
    BuiltValueNullFieldError.checkNotNull(
        submission_deadline, r'AccountabilityEvent', 'submission_deadline');
    BuiltValueNullFieldError.checkNotNull(
        submission_start, r'AccountabilityEvent', 'submission_start');
    BuiltValueNullFieldError.checkNotNull(
        attending_units, r'AccountabilityEvent', 'attending_units');
    BuiltValueNullFieldError.checkNotNull(
        attending_class_years, r'AccountabilityEvent', 'attending_class_years');
    BuiltValueNullFieldError.checkNotNull(
        attending_users, r'AccountabilityEvent', 'attending_users');
    BuiltValueNullFieldError.checkNotNull(
        accountability_method, r'AccountabilityEvent', 'accountability_method');
  }

  @override
  AccountabilityEvent rebuild(
          void Function(AccountabilityEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountabilityEventBuilder toBuilder() =>
      new AccountabilityEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountabilityEvent &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        description == other.description &&
        time == other.time &&
        submission_deadline == other.submission_deadline &&
        submission_start == other.submission_start &&
        attending_units == other.attending_units &&
        attending_class_years == other.attending_class_years &&
        attending_users == other.attending_users &&
        accountability_method == other.accountability_method;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, submission_deadline.hashCode);
    _$hash = $jc(_$hash, submission_start.hashCode);
    _$hash = $jc(_$hash, attending_units.hashCode);
    _$hash = $jc(_$hash, attending_class_years.hashCode);
    _$hash = $jc(_$hash, attending_users.hashCode);
    _$hash = $jc(_$hash, accountability_method.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountabilityEvent')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('description', description)
          ..add('time', time)
          ..add('submission_deadline', submission_deadline)
          ..add('submission_start', submission_start)
          ..add('attending_units', attending_units)
          ..add('attending_class_years', attending_class_years)
          ..add('attending_users', attending_users)
          ..add('accountability_method', accountability_method))
        .toString();
  }
}

class AccountabilityEventBuilder
    implements Builder<AccountabilityEvent, AccountabilityEventBuilder> {
  _$AccountabilityEvent? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

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

  ListBuilder<String>? _attending_units;
  ListBuilder<String> get attending_units =>
      _$this._attending_units ??= new ListBuilder<String>();
  set attending_units(ListBuilder<String>? attending_units) =>
      _$this._attending_units = attending_units;

  ListBuilder<bool>? _attending_class_years;
  ListBuilder<bool> get attending_class_years =>
      _$this._attending_class_years ??= new ListBuilder<bool>();
  set attending_class_years(ListBuilder<bool>? attending_class_years) =>
      _$this._attending_class_years = attending_class_years;

  ListBuilder<String>? _attending_users;
  ListBuilder<String> get attending_users =>
      _$this._attending_users ??= new ListBuilder<String>();
  set attending_users(ListBuilder<String>? attending_users) =>
      _$this._attending_users = attending_users;

  String? _accountability_method;
  String? get accountability_method => _$this._accountability_method;
  set accountability_method(String? accountability_method) =>
      _$this._accountability_method = accountability_method;

  AccountabilityEventBuilder();

  AccountabilityEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _description = $v.description;
      _time = $v.time;
      _submission_deadline = $v.submission_deadline;
      _submission_start = $v.submission_start;
      _attending_units = $v.attending_units.toBuilder();
      _attending_class_years = $v.attending_class_years.toBuilder();
      _attending_users = $v.attending_users.toBuilder();
      _accountability_method = $v.accountability_method;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountabilityEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountabilityEvent;
  }

  @override
  void update(void Function(AccountabilityEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountabilityEvent build() => _build();

  _$AccountabilityEvent _build() {
    _$AccountabilityEvent _$result;
    try {
      _$result = _$v ??
          new _$AccountabilityEvent._(
              id: id,
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'AccountabilityEvent', 'type'),
              name: name,
              description: description,
              time: BuiltValueNullFieldError.checkNotNull(
                  time, r'AccountabilityEvent', 'time'),
              submission_deadline: BuiltValueNullFieldError.checkNotNull(
                  submission_deadline,
                  r'AccountabilityEvent',
                  'submission_deadline'),
              submission_start: BuiltValueNullFieldError.checkNotNull(
                  submission_start, r'AccountabilityEvent', 'submission_start'),
              attending_units: attending_units.build(),
              attending_class_years: attending_class_years.build(),
              attending_users: attending_users.build(),
              accountability_method: BuiltValueNullFieldError.checkNotNull(
                  accountability_method,
                  r'AccountabilityEvent',
                  'accountability_method'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attending_units';
        attending_units.build();
        _$failedField = 'attending_class_years';
        attending_class_years.build();
        _$failedField = 'attending_users';
        attending_users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AccountabilityEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AccountabilityEventStatus extends AccountabilityEventStatus {
  @override
  final AccountabilityEvent event;
  @override
  final BuiltList<UserSummary> signed;
  @override
  final BuiltList<UserSummary> unsigned;
  @override
  final BuiltList<UserSummary> excused;

  factory _$AccountabilityEventStatus(
          [void Function(AccountabilityEventStatusBuilder)? updates]) =>
      (new AccountabilityEventStatusBuilder()..update(updates))._build();

  _$AccountabilityEventStatus._(
      {required this.event,
      required this.signed,
      required this.unsigned,
      required this.excused})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        event, r'AccountabilityEventStatus', 'event');
    BuiltValueNullFieldError.checkNotNull(
        signed, r'AccountabilityEventStatus', 'signed');
    BuiltValueNullFieldError.checkNotNull(
        unsigned, r'AccountabilityEventStatus', 'unsigned');
    BuiltValueNullFieldError.checkNotNull(
        excused, r'AccountabilityEventStatus', 'excused');
  }

  @override
  AccountabilityEventStatus rebuild(
          void Function(AccountabilityEventStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountabilityEventStatusBuilder toBuilder() =>
      new AccountabilityEventStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountabilityEventStatus &&
        event == other.event &&
        signed == other.signed &&
        unsigned == other.unsigned &&
        excused == other.excused;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, signed.hashCode);
    _$hash = $jc(_$hash, unsigned.hashCode);
    _$hash = $jc(_$hash, excused.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountabilityEventStatus')
          ..add('event', event)
          ..add('signed', signed)
          ..add('unsigned', unsigned)
          ..add('excused', excused))
        .toString();
  }
}

class AccountabilityEventStatusBuilder
    implements
        Builder<AccountabilityEventStatus, AccountabilityEventStatusBuilder> {
  _$AccountabilityEventStatus? _$v;

  AccountabilityEventBuilder? _event;
  AccountabilityEventBuilder get event =>
      _$this._event ??= new AccountabilityEventBuilder();
  set event(AccountabilityEventBuilder? event) => _$this._event = event;

  ListBuilder<UserSummary>? _signed;
  ListBuilder<UserSummary> get signed =>
      _$this._signed ??= new ListBuilder<UserSummary>();
  set signed(ListBuilder<UserSummary>? signed) => _$this._signed = signed;

  ListBuilder<UserSummary>? _unsigned;
  ListBuilder<UserSummary> get unsigned =>
      _$this._unsigned ??= new ListBuilder<UserSummary>();
  set unsigned(ListBuilder<UserSummary>? unsigned) =>
      _$this._unsigned = unsigned;

  ListBuilder<UserSummary>? _excused;
  ListBuilder<UserSummary> get excused =>
      _$this._excused ??= new ListBuilder<UserSummary>();
  set excused(ListBuilder<UserSummary>? excused) => _$this._excused = excused;

  AccountabilityEventStatusBuilder();

  AccountabilityEventStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event = $v.event.toBuilder();
      _signed = $v.signed.toBuilder();
      _unsigned = $v.unsigned.toBuilder();
      _excused = $v.excused.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountabilityEventStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountabilityEventStatus;
  }

  @override
  void update(void Function(AccountabilityEventStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountabilityEventStatus build() => _build();

  _$AccountabilityEventStatus _build() {
    _$AccountabilityEventStatus _$result;
    try {
      _$result = _$v ??
          new _$AccountabilityEventStatus._(
              event: event.build(),
              signed: signed.build(),
              unsigned: unsigned.build(),
              excused: excused.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event';
        event.build();
        _$failedField = 'signed';
        signed.build();
        _$failedField = 'unsigned';
        unsigned.build();
        _$failedField = 'excused';
        excused.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AccountabilityEventStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EventList extends EventList {
  @override
  final BuiltList<AccountabilityEvent> events;

  factory _$EventList([void Function(EventListBuilder)? updates]) =>
      (new EventListBuilder()..update(updates))._build();

  _$EventList._({required this.events}) : super._() {
    BuiltValueNullFieldError.checkNotNull(events, r'EventList', 'events');
  }

  @override
  EventList rebuild(void Function(EventListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventListBuilder toBuilder() => new EventListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventList && events == other.events;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventList')..add('events', events))
        .toString();
  }
}

class EventListBuilder implements Builder<EventList, EventListBuilder> {
  _$EventList? _$v;

  ListBuilder<AccountabilityEvent>? _events;
  ListBuilder<AccountabilityEvent> get events =>
      _$this._events ??= new ListBuilder<AccountabilityEvent>();
  set events(ListBuilder<AccountabilityEvent>? events) =>
      _$this._events = events;

  EventListBuilder();

  EventListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _events = $v.events.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventList;
  }

  @override
  void update(void Function(EventListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventList build() => _build();

  _$EventList _build() {
    _$EventList _$result;
    try {
      _$result = _$v ?? new _$EventList._(events: events.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'events';
        events.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
