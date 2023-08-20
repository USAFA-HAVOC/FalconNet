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
    ];

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

  factory _$UserSummary([void Function(UserSummaryBuilder)? updates]) =>
      (new UserSummaryBuilder()..update(updates))._build();

  _$UserSummary._(
      {required this.user_id, required this.name, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'UserSummary', 'user_id');
    BuiltValueNullFieldError.checkNotNull(name, r'UserSummary', 'name');
    BuiltValueNullFieldError.checkNotNull(status, r'UserSummary', 'status');
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
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSummary')
          ..add('user_id', user_id)
          ..add('name', name)
          ..add('status', status))
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

  UserSummaryBuilder();

  UserSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _name = $v.name;
      _status = $v.status.toBuilder();
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
              status: status.build());
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
