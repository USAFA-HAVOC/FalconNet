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
      'personal_info',
      serializers.serialize(object.personal_info,
          specifiedType: const FullType(UserPersonalInfo)),
      'roles',
      serializers.serialize(object.roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pass_allocation;
    if (value != null) {
      result
        ..add('pass_allocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetPassAllocation)));
    }
    value = object.di;
    if (value != null) {
      result
        ..add('di')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetDI)));
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
        case 'personal_info':
          result.personal_info.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserPersonalInfo))!
              as UserPersonalInfo);
          break;
        case 'pass_allocation':
          result.pass_allocation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CadetPassAllocation))!
              as CadetPassAllocation);
          break;
        case 'di':
          result.di.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetDI))! as CadetDI);
          break;
        case 'last_login':
          result.last_login = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'roles':
          result.roles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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
  final UserPersonalInfo personal_info;
  @override
  final CadetPassAllocation? pass_allocation;
  @override
  final CadetDI? di;
  @override
  final DateTime? last_login;
  @override
  final BuiltList<String> roles;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.id,
      required this.personal_info,
      this.pass_allocation,
      this.di,
      this.last_login,
      required this.roles})
      : super._() {
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
        personal_info == other.personal_info &&
        pass_allocation == other.pass_allocation &&
        di == other.di &&
        last_login == other.last_login &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, personal_info.hashCode);
    _$hash = $jc(_$hash, pass_allocation.hashCode);
    _$hash = $jc(_$hash, di.hashCode);
    _$hash = $jc(_$hash, last_login.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('personal_info', personal_info)
          ..add('pass_allocation', pass_allocation)
          ..add('di', di)
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

  UserPersonalInfoBuilder? _personal_info;
  UserPersonalInfoBuilder get personal_info =>
      _$this._personal_info ??= new UserPersonalInfoBuilder();
  set personal_info(UserPersonalInfoBuilder? personal_info) =>
      _$this._personal_info = personal_info;

  CadetPassAllocationBuilder? _pass_allocation;
  CadetPassAllocationBuilder get pass_allocation =>
      _$this._pass_allocation ??= new CadetPassAllocationBuilder();
  set pass_allocation(CadetPassAllocationBuilder? pass_allocation) =>
      _$this._pass_allocation = pass_allocation;

  CadetDIBuilder? _di;
  CadetDIBuilder get di => _$this._di ??= new CadetDIBuilder();
  set di(CadetDIBuilder? di) => _$this._di = di;

  DateTime? _last_login;
  DateTime? get last_login => _$this._last_login;
  set last_login(DateTime? last_login) => _$this._last_login = last_login;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= new ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _personal_info = $v.personal_info.toBuilder();
      _pass_allocation = $v.pass_allocation?.toBuilder();
      _di = $v.di?.toBuilder();
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
              personal_info: personal_info.build(),
              pass_allocation: _pass_allocation?.build(),
              di: _di?.build(),
              last_login: last_login,
              roles: roles.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'personal_info';
        personal_info.build();
        _$failedField = 'pass_allocation';
        _pass_allocation?.build();
        _$failedField = 'di';
        _di?.build();

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
