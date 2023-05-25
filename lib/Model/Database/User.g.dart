// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ms_oid',
      serializers.serialize(object.ms_oid,
          specifiedType: const FullType(String)),
      'units',
      serializers.serialize(object.units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'personal_info',
      serializers.serialize(object.personal_info,
          specifiedType: const FullType(UserPersonalInfo)),
      'roles',
      serializers.serialize(object.roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TimedRole)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assigned_unit;
    if (value != null) {
      result
        ..add('assigned_unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountability;
    if (value != null) {
      result
        ..add('accountability')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetAccountability)));
    }
    value = object.last_login;
    if (value != null) {
      result
        ..add('last_login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'ms_oid':
          result.ms_oid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'units':
          result.units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'assigned_unit':
          result.assigned_unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'personal_info':
          result.personal_info.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserPersonalInfo))!
              as UserPersonalInfo);
          break;
        case 'accountability':
          result.accountability.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CadetAccountability))!
              as CadetAccountability);
          break;
        case 'last_login':
          result.last_login = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'roles':
          result.roles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TimedRole)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String? id;
  @override
  final String ms_oid;
  @override
  final BuiltList<String> units;
  @override
  final String? assigned_unit;
  @override
  final UserPersonalInfo personal_info;
  @override
  final CadetAccountability? accountability;
  @override
  final DateTime? last_login;
  @override
  final BuiltList<TimedRole> roles;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.id,
      required this.ms_oid,
      required this.units,
      this.assigned_unit,
      required this.personal_info,
      this.accountability,
      this.last_login,
      required this.roles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(ms_oid, r'User', 'ms_oid');
    BuiltValueNullFieldError.checkNotNull(units, r'User', 'units');
    BuiltValueNullFieldError.checkNotNull(
        personal_info, r'User', 'personal_info');
    BuiltValueNullFieldError.checkNotNull(roles, r'User', 'roles');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        ms_oid == other.ms_oid &&
        units == other.units &&
        assigned_unit == other.assigned_unit &&
        personal_info == other.personal_info &&
        accountability == other.accountability &&
        last_login == other.last_login &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ms_oid.hashCode);
    _$hash = $jc(_$hash, units.hashCode);
    _$hash = $jc(_$hash, assigned_unit.hashCode);
    _$hash = $jc(_$hash, personal_info.hashCode);
    _$hash = $jc(_$hash, accountability.hashCode);
    _$hash = $jc(_$hash, last_login.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('ms_oid', ms_oid)
          ..add('units', units)
          ..add('assigned_unit', assigned_unit)
          ..add('personal_info', personal_info)
          ..add('accountability', accountability)
          ..add('last_login', last_login)
          ..add('roles', roles))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _ms_oid;
  String? get ms_oid => _$this._ms_oid;
  set ms_oid(String? ms_oid) => _$this._ms_oid = ms_oid;

  ListBuilder<String>? _units;
  ListBuilder<String> get units => _$this._units ??= new ListBuilder<String>();
  set units(ListBuilder<String>? units) => _$this._units = units;

  String? _assigned_unit;
  String? get assigned_unit => _$this._assigned_unit;
  set assigned_unit(String? assigned_unit) =>
      _$this._assigned_unit = assigned_unit;

  UserPersonalInfoBuilder? _personal_info;
  UserPersonalInfoBuilder get personal_info =>
      _$this._personal_info ??= new UserPersonalInfoBuilder();
  set personal_info(UserPersonalInfoBuilder? personal_info) =>
      _$this._personal_info = personal_info;

  CadetAccountabilityBuilder? _accountability;
  CadetAccountabilityBuilder get accountability =>
      _$this._accountability ??= new CadetAccountabilityBuilder();
  set accountability(CadetAccountabilityBuilder? accountability) =>
      _$this._accountability = accountability;

  DateTime? _last_login;
  DateTime? get last_login => _$this._last_login;
  set last_login(DateTime? last_login) => _$this._last_login = last_login;

  ListBuilder<TimedRole>? _roles;
  ListBuilder<TimedRole> get roles =>
      _$this._roles ??= new ListBuilder<TimedRole>();
  set roles(ListBuilder<TimedRole>? roles) => _$this._roles = roles;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ms_oid = $v.ms_oid;
      _units = $v.units.toBuilder();
      _assigned_unit = $v.assigned_unit;
      _personal_info = $v.personal_info.toBuilder();
      _accountability = $v.accountability?.toBuilder();
      _last_login = $v.last_login;
      _roles = $v.roles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: id,
              ms_oid: BuiltValueNullFieldError.checkNotNull(
                  ms_oid, r'User', 'ms_oid'),
              units: units.build(),
              assigned_unit: assigned_unit,
              personal_info: personal_info.build(),
              accountability: _accountability?.build(),
              last_login: last_login,
              roles: roles.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'units';
        units.build();

        _$failedField = 'personal_info';
        personal_info.build();
        _$failedField = 'accountability';
        _accountability?.build();

        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
