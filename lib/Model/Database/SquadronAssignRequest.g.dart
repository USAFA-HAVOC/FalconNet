// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SquadronAssignRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SquadronAssignRequest> _$squadronAssignRequestSerializer =
    new _$SquadronAssignRequestSerializer();

class _$SquadronAssignRequestSerializer
    implements StructuredSerializer<SquadronAssignRequest> {
  @override
  final Iterable<Type> types = const [
    SquadronAssignRequest,
    _$SquadronAssignRequest
  ];
  @override
  final String wireName = 'SquadronAssignRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SquadronAssignRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'squadron',
      serializers.serialize(object.squadron,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SquadronAssignRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SquadronAssignRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'squadron':
          result.squadron = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SquadronAssignRequest extends SquadronAssignRequest {
  @override
  final BuiltList<String> users;
  @override
  final int squadron;

  factory _$SquadronAssignRequest(
          [void Function(SquadronAssignRequestBuilder)? updates]) =>
      (new SquadronAssignRequestBuilder()..update(updates))._build();

  _$SquadronAssignRequest._({required this.users, required this.squadron})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        users, r'SquadronAssignRequest', 'users');
    BuiltValueNullFieldError.checkNotNull(
        squadron, r'SquadronAssignRequest', 'squadron');
  }

  @override
  SquadronAssignRequest rebuild(
          void Function(SquadronAssignRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SquadronAssignRequestBuilder toBuilder() =>
      new SquadronAssignRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SquadronAssignRequest &&
        users == other.users &&
        squadron == other.squadron;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, squadron.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SquadronAssignRequest')
          ..add('users', users)
          ..add('squadron', squadron))
        .toString();
  }
}

class SquadronAssignRequestBuilder
    implements Builder<SquadronAssignRequest, SquadronAssignRequestBuilder> {
  _$SquadronAssignRequest? _$v;

  ListBuilder<String>? _users;
  ListBuilder<String> get users => _$this._users ??= new ListBuilder<String>();
  set users(ListBuilder<String>? users) => _$this._users = users;

  int? _squadron;
  int? get squadron => _$this._squadron;
  set squadron(int? squadron) => _$this._squadron = squadron;

  SquadronAssignRequestBuilder();

  SquadronAssignRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _squadron = $v.squadron;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SquadronAssignRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SquadronAssignRequest;
  }

  @override
  void update(void Function(SquadronAssignRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SquadronAssignRequest build() => _build();

  _$SquadronAssignRequest _build() {
    _$SquadronAssignRequest _$result;
    try {
      _$result = _$v ??
          new _$SquadronAssignRequest._(
              users: users.build(),
              squadron: BuiltValueNullFieldError.checkNotNull(
                  squadron, r'SquadronAssignRequest', 'squadron'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SquadronAssignRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
