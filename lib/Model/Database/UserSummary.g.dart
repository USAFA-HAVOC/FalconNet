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
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(UserEventStatus)),
      'class_year_idx',
      serializers.serialize(object.class_year_idx,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.phone_number;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.room_number;
    if (value != null) {
      result
        ..add('room_number')
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
        case 'status':
          result.status.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserEventStatus))!
              as UserEventStatus);
          break;
        case 'phone_number':
          result.phone_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'room_number':
          result.room_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'class_year_idx':
          result.class_year_idx = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
  final UserEventStatus status;
  @override
  final String? phone_number;
  @override
  final String? room_number;
  @override
  final int class_year_idx;

  factory _$UserSummary([void Function(UserSummaryBuilder)? updates]) =>
      (new UserSummaryBuilder()..update(updates))._build();

  _$UserSummary._(
      {required this.user_id,
      required this.name,
      required this.status,
      this.phone_number,
      this.room_number,
      required this.class_year_idx})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'UserSummary', 'user_id');
    BuiltValueNullFieldError.checkNotNull(name, r'UserSummary', 'name');
    BuiltValueNullFieldError.checkNotNull(status, r'UserSummary', 'status');
    BuiltValueNullFieldError.checkNotNull(
        class_year_idx, r'UserSummary', 'class_year_idx');
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
        status == other.status &&
        phone_number == other.phone_number &&
        room_number == other.room_number &&
        class_year_idx == other.class_year_idx;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, phone_number.hashCode);
    _$hash = $jc(_$hash, room_number.hashCode);
    _$hash = $jc(_$hash, class_year_idx.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSummary')
          ..add('user_id', user_id)
          ..add('name', name)
          ..add('status', status)
          ..add('phone_number', phone_number)
          ..add('room_number', room_number)
          ..add('class_year_idx', class_year_idx))
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

  UserEventStatusBuilder? _status;
  UserEventStatusBuilder get status =>
      _$this._status ??= new UserEventStatusBuilder();
  set status(UserEventStatusBuilder? status) => _$this._status = status;

  String? _phone_number;
  String? get phone_number => _$this._phone_number;
  set phone_number(String? phone_number) => _$this._phone_number = phone_number;

  String? _room_number;
  String? get room_number => _$this._room_number;
  set room_number(String? room_number) => _$this._room_number = room_number;

  int? _class_year_idx;
  int? get class_year_idx => _$this._class_year_idx;
  set class_year_idx(int? class_year_idx) =>
      _$this._class_year_idx = class_year_idx;

  UserSummaryBuilder();

  UserSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _name = $v.name;
      _status = $v.status.toBuilder();
      _phone_number = $v.phone_number;
      _room_number = $v.room_number;
      _class_year_idx = $v.class_year_idx;
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
              status: status.build(),
              phone_number: phone_number,
              room_number: room_number,
              class_year_idx: BuiltValueNullFieldError.checkNotNull(
                  class_year_idx, r'UserSummary', 'class_year_idx'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'status';
        status.build();
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
