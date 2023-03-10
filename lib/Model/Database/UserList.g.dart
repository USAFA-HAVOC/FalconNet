// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserList.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserList> _$userListSerializer = new _$UserListSerializer();

class _$UserListSerializer implements StructuredSerializer<UserList> {
  @override
  final Iterable<Type> types = const [UserList, _$UserList];
  @override
  final String wireName = 'UserList';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(User)])),
    ];

    return result;
  }

  @override
  UserList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(User)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserList extends UserList {
  @override
  final BuiltList<User> users;

  factory _$UserList([void Function(UserListBuilder)? updates]) =>
      (new UserListBuilder()..update(updates))._build();

  _$UserList._({required this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, r'UserList', 'users');
  }

  @override
  UserList rebuild(void Function(UserListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserListBuilder toBuilder() => new UserListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserList && users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserList')..add('users', users))
        .toString();
  }
}

class UserListBuilder implements Builder<UserList, UserListBuilder> {
  _$UserList? _$v;

  ListBuilder<User>? _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User>? users) => _$this._users = users;

  UserListBuilder();

  UserListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserList;
  }

  @override
  void update(void Function(UserListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserList build() => _build();

  _$UserList _build() {
    _$UserList _$result;
    try {
      _$result = _$v ?? new _$UserList._(users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
