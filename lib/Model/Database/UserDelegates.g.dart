// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDelegates.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDelegates> _$userDelegatesSerializer =
    new _$UserDelegatesSerializer();

class _$UserDelegatesSerializer implements StructuredSerializer<UserDelegates> {
  @override
  final Iterable<Type> types = const [UserDelegates, _$UserDelegates];
  @override
  final String wireName = 'UserDelegates';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserDelegates object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'assigned_unit',
      serializers.serialize(object.assigned_unit,
          specifiedType: const FullType(String)),
      'units',
      serializers.serialize(object.units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'roles',
      serializers.serialize(object.roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TimedRole)])),
    ];
    Object? value;
    value = object.class_year_idx;
    if (value != null) {
      result
        ..add('class_year_idx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UserDelegates deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDelegatesBuilder();

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
        case 'class_year_idx':
          result.class_year_idx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'assigned_unit':
          result.assigned_unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'units':
          result.units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$UserDelegates extends UserDelegates {
  @override
  final String user_id;
  @override
  final String name;
  @override
  final int? class_year_idx;
  @override
  final String assigned_unit;
  @override
  final BuiltList<String> units;
  @override
  final BuiltList<TimedRole> roles;

  factory _$UserDelegates([void Function(UserDelegatesBuilder)? updates]) =>
      (new UserDelegatesBuilder()..update(updates))._build();

  _$UserDelegates._(
      {required this.user_id,
      required this.name,
      this.class_year_idx,
      required this.assigned_unit,
      required this.units,
      required this.roles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'UserDelegates', 'user_id');
    BuiltValueNullFieldError.checkNotNull(name, r'UserDelegates', 'name');
    BuiltValueNullFieldError.checkNotNull(
        assigned_unit, r'UserDelegates', 'assigned_unit');
    BuiltValueNullFieldError.checkNotNull(units, r'UserDelegates', 'units');
    BuiltValueNullFieldError.checkNotNull(roles, r'UserDelegates', 'roles');
  }

  @override
  UserDelegates rebuild(void Function(UserDelegatesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDelegatesBuilder toBuilder() => new UserDelegatesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDelegates &&
        user_id == other.user_id &&
        name == other.name &&
        class_year_idx == other.class_year_idx &&
        assigned_unit == other.assigned_unit &&
        units == other.units &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, class_year_idx.hashCode);
    _$hash = $jc(_$hash, assigned_unit.hashCode);
    _$hash = $jc(_$hash, units.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDelegates')
          ..add('user_id', user_id)
          ..add('name', name)
          ..add('class_year_idx', class_year_idx)
          ..add('assigned_unit', assigned_unit)
          ..add('units', units)
          ..add('roles', roles))
        .toString();
  }
}

class UserDelegatesBuilder
    implements Builder<UserDelegates, UserDelegatesBuilder> {
  _$UserDelegates? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _class_year_idx;
  int? get class_year_idx => _$this._class_year_idx;
  set class_year_idx(int? class_year_idx) =>
      _$this._class_year_idx = class_year_idx;

  String? _assigned_unit;
  String? get assigned_unit => _$this._assigned_unit;
  set assigned_unit(String? assigned_unit) =>
      _$this._assigned_unit = assigned_unit;

  ListBuilder<String>? _units;
  ListBuilder<String> get units => _$this._units ??= new ListBuilder<String>();
  set units(ListBuilder<String>? units) => _$this._units = units;

  ListBuilder<TimedRole>? _roles;
  ListBuilder<TimedRole> get roles =>
      _$this._roles ??= new ListBuilder<TimedRole>();
  set roles(ListBuilder<TimedRole>? roles) => _$this._roles = roles;

  UserDelegatesBuilder();

  UserDelegatesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _name = $v.name;
      _class_year_idx = $v.class_year_idx;
      _assigned_unit = $v.assigned_unit;
      _units = $v.units.toBuilder();
      _roles = $v.roles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDelegates other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDelegates;
  }

  @override
  void update(void Function(UserDelegatesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDelegates build() => _build();

  _$UserDelegates _build() {
    _$UserDelegates _$result;
    try {
      _$result = _$v ??
          new _$UserDelegates._(
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'UserDelegates', 'user_id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'UserDelegates', 'name'),
              class_year_idx: class_year_idx,
              assigned_unit: BuiltValueNullFieldError.checkNotNull(
                  assigned_unit, r'UserDelegates', 'assigned_unit'),
              units: units.build(),
              roles: roles.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'units';
        units.build();
        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserDelegates', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
