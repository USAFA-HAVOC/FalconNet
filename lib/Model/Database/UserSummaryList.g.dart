// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserSummaryList.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSummaryList> _$userSummaryListSerializer =
    new _$UserSummaryListSerializer();

class _$UserSummaryListSerializer
    implements StructuredSerializer<UserSummaryList> {
  @override
  final Iterable<Type> types = const [UserSummaryList, _$UserSummaryList];
  @override
  final String wireName = 'UserSummaryList';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserSummaryList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserSummary)])),
    ];

    return result;
  }

  @override
  UserSummaryList deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSummaryListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserSummary)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserSummaryList extends UserSummaryList {
  @override
  final BuiltList<UserSummary> users;

  factory _$UserSummaryList([void Function(UserSummaryListBuilder)? updates]) =>
      (new UserSummaryListBuilder()..update(updates))._build();

  _$UserSummaryList._({required this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, r'UserSummaryList', 'users');
  }

  @override
  UserSummaryList rebuild(void Function(UserSummaryListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSummaryListBuilder toBuilder() =>
      new UserSummaryListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSummaryList && users == other.users;
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
    return (newBuiltValueToStringHelper(r'UserSummaryList')
          ..add('users', users))
        .toString();
  }
}

class UserSummaryListBuilder
    implements Builder<UserSummaryList, UserSummaryListBuilder> {
  _$UserSummaryList? _$v;

  ListBuilder<UserSummary>? _users;
  ListBuilder<UserSummary> get users =>
      _$this._users ??= new ListBuilder<UserSummary>();
  set users(ListBuilder<UserSummary>? users) => _$this._users = users;

  UserSummaryListBuilder();

  UserSummaryListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSummaryList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSummaryList;
  }

  @override
  void update(void Function(UserSummaryListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSummaryList build() => _build();

  _$UserSummaryList _build() {
    _$UserSummaryList _$result;
    try {
      _$result = _$v ?? new _$UserSummaryList._(users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserSummaryList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
