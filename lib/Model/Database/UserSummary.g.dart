// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserSummary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSummary> _$userSummarySerializer = new _$UserSummarySerializer();

class _$UserSummarySerializer implements StructuredSerializer<UserSummary> {
  @override
  final Iterable<Type> types = const [UserSummary, _$UserSummary];
  @override
  final String wireName = 'UserSummary';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserSummary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'events',
      serializers.serialize(object.events,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserEvent)])),
    ];
    Object? value;
    value = object.room;
    if (value != null) {
      result
        ..add('room')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserSummary deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'room':
          result.room = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'events':
          result.events.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserEvent)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserSummary extends UserSummary {
  @override
  final String user_id;
  @override
  final String name;
  @override
  final String? room;
  @override
  final BuiltList<UserEvent> events;

  factory _$UserSummary([void Function(UserSummaryBuilder)? updates]) =>
      (new UserSummaryBuilder()..update(updates))._build();

  _$UserSummary._(
      {required this.user_id,
      required this.name,
      this.room,
      required this.events})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'UserSummary', 'user_id');
    BuiltValueNullFieldError.checkNotNull(name, r'UserSummary', 'name');
    BuiltValueNullFieldError.checkNotNull(events, r'UserSummary', 'events');
  }

  @override
  UserSummary rebuild(void Function(UserSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSummaryBuilder toBuilder() => new UserSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSummary &&
        user_id == other.user_id &&
        name == other.name &&
        room == other.room &&
        events == other.events;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, room.hashCode);
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSummary')
          ..add('user_id', user_id)
          ..add('name', name)
          ..add('room', room)
          ..add('events', events))
        .toString();
  }
}

class UserSummaryBuilder implements Builder<UserSummary, UserSummaryBuilder> {
  _$UserSummary? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _room;
  String? get room => _$this._room;
  set room(String? room) => _$this._room = room;

  ListBuilder<UserEvent>? _events;
  ListBuilder<UserEvent> get events =>
      _$this._events ??= new ListBuilder<UserEvent>();
  set events(ListBuilder<UserEvent>? events) => _$this._events = events;

  UserSummaryBuilder();

  UserSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _name = $v.name;
      _room = $v.room;
      _events = $v.events.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSummary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSummary;
  }

  @override
  void update(void Function(UserSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSummary build() => _build();

  _$UserSummary _build() {
    _$UserSummary _$result;
    try {
      _$result = _$v ??
          new _$UserSummary._(
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'UserSummary', 'user_id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'UserSummary', 'name'),
              room: room,
              events: events.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'events';
        events.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserSummary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
