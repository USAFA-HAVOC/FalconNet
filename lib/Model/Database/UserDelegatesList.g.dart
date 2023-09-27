// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDelegatesList.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDelegatesList> _$userDelegatesListSerializer =
    new _$UserDelegatesListSerializer();

class _$UserDelegatesListSerializer
    implements StructuredSerializer<UserDelegatesList> {
  @override
  final Iterable<Type> types = const [UserDelegatesList, _$UserDelegatesList];
  @override
  final String wireName = 'UserDelegatesList';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserDelegatesList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserDelegates)])),
    ];

    return result;
  }

  @override
  UserDelegatesList deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDelegatesListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserDelegates)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserDelegatesList extends UserDelegatesList {
  @override
  final BuiltList<UserDelegates> users;

  factory _$UserDelegatesList(
          [void Function(UserDelegatesListBuilder)? updates]) =>
      (new UserDelegatesListBuilder()..update(updates))._build();

  _$UserDelegatesList._({required this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, r'UserDelegatesList', 'users');
  }

  @override
  UserDelegatesList rebuild(void Function(UserDelegatesListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDelegatesListBuilder toBuilder() =>
      new UserDelegatesListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDelegatesList && users == other.users;
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
    return (newBuiltValueToStringHelper(r'UserDelegatesList')
          ..add('users', users))
        .toString();
  }
}

class UserDelegatesListBuilder
    implements Builder<UserDelegatesList, UserDelegatesListBuilder> {
  _$UserDelegatesList? _$v;

  ListBuilder<UserDelegates>? _users;
  ListBuilder<UserDelegates> get users =>
      _$this._users ??= new ListBuilder<UserDelegates>();
  set users(ListBuilder<UserDelegates>? users) => _$this._users = users;

  UserDelegatesListBuilder();

  UserDelegatesListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDelegatesList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDelegatesList;
  }

  @override
  void update(void Function(UserDelegatesListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDelegatesList build() => _build();

  _$UserDelegatesList _build() {
    _$UserDelegatesList _$result;
    try {
      _$result = _$v ?? new _$UserDelegatesList._(users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserDelegatesList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
