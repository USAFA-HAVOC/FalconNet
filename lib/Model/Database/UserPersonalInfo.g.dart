// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPersonalInfo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserPersonalInfo> _$userPersonalInfoSerializer =
    new _$UserPersonalInfoSerializer();

class _$UserPersonalInfoSerializer
    implements StructuredSerializer<UserPersonalInfo> {
  @override
  final Iterable<Type> types = const [UserPersonalInfo, _$UserPersonalInfo];
  @override
  final String wireName = 'UserPersonalInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserPersonalInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'full_name',
      serializers.serialize(object.full_name,
          specifiedType: const FullType(String)),
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
    value = object.squadron;
    if (value != null) {
      result
        ..add('squadron')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unit;
    if (value != null) {
      result
        ..add('unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserPersonalInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPersonalInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'full_name':
          result.full_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone_number':
          result.phone_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'room_number':
          result.room_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'squadron':
          result.squadron = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserPersonalInfo extends UserPersonalInfo {
  @override
  final String email;
  @override
  final String full_name;
  @override
  final String? phone_number;
  @override
  final String? room_number;
  @override
  final int? squadron;
  @override
  final String? group;
  @override
  final String? unit;

  factory _$UserPersonalInfo(
          [void Function(UserPersonalInfoBuilder)? updates]) =>
      (new UserPersonalInfoBuilder()..update(updates))._build();

  _$UserPersonalInfo._(
      {required this.email,
      required this.full_name,
      this.phone_number,
      this.room_number,
      this.squadron,
      this.group,
      this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'UserPersonalInfo', 'email');
    BuiltValueNullFieldError.checkNotNull(
        full_name, r'UserPersonalInfo', 'full_name');
  }

  @override
  UserPersonalInfo rebuild(void Function(UserPersonalInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPersonalInfoBuilder toBuilder() =>
      new UserPersonalInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPersonalInfo &&
        email == other.email &&
        full_name == other.full_name &&
        phone_number == other.phone_number &&
        room_number == other.room_number &&
        squadron == other.squadron &&
        group == other.group &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, full_name.hashCode);
    _$hash = $jc(_$hash, phone_number.hashCode);
    _$hash = $jc(_$hash, room_number.hashCode);
    _$hash = $jc(_$hash, squadron.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPersonalInfo')
          ..add('email', email)
          ..add('full_name', full_name)
          ..add('phone_number', phone_number)
          ..add('room_number', room_number)
          ..add('squadron', squadron)
          ..add('group', group)
          ..add('unit', unit))
        .toString();
  }
}

class UserPersonalInfoBuilder
    implements Builder<UserPersonalInfo, UserPersonalInfoBuilder> {
  _$UserPersonalInfo? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _full_name;
  String? get full_name => _$this._full_name;
  set full_name(String? full_name) => _$this._full_name = full_name;

  String? _phone_number;
  String? get phone_number => _$this._phone_number;
  set phone_number(String? phone_number) => _$this._phone_number = phone_number;

  String? _room_number;
  String? get room_number => _$this._room_number;
  set room_number(String? room_number) => _$this._room_number = room_number;

  int? _squadron;
  int? get squadron => _$this._squadron;
  set squadron(int? squadron) => _$this._squadron = squadron;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  UserPersonalInfoBuilder();

  UserPersonalInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _full_name = $v.full_name;
      _phone_number = $v.phone_number;
      _room_number = $v.room_number;
      _squadron = $v.squadron;
      _group = $v.group;
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPersonalInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPersonalInfo;
  }

  @override
  void update(void Function(UserPersonalInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPersonalInfo build() => _build();

  _$UserPersonalInfo _build() {
    final _$result = _$v ??
        new _$UserPersonalInfo._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserPersonalInfo', 'email'),
            full_name: BuiltValueNullFieldError.checkNotNull(
                full_name, r'UserPersonalInfo', 'full_name'),
            phone_number: phone_number,
            room_number: room_number,
            squadron: squadron,
            group: group,
            unit: unit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
