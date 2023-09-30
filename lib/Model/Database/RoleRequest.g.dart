// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoleRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoleRequest> _$roleRequestSerializer = new _$RoleRequestSerializer();

class _$RoleRequestSerializer implements StructuredSerializer<RoleRequest> {
  @override
  final Iterable<Type> types = const [RoleRequest, _$RoleRequest];
  @override
  final String wireName = 'RoleRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoleRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'new_roles',
      serializers.serialize(object.new_roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TimedRole)])),
    ];

    return result;
  }

  @override
  RoleRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoleRequestBuilder();

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
        case 'new_roles':
          result.new_roles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TimedRole)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$RoleRequest extends RoleRequest {
  @override
  final String user_id;
  @override
  final BuiltList<TimedRole> new_roles;

  factory _$RoleRequest([void Function(RoleRequestBuilder)? updates]) =>
      (new RoleRequestBuilder()..update(updates))._build();

  _$RoleRequest._({required this.user_id, required this.new_roles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'RoleRequest', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        new_roles, r'RoleRequest', 'new_roles');
  }

  @override
  RoleRequest rebuild(void Function(RoleRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleRequestBuilder toBuilder() => new RoleRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoleRequest &&
        user_id == other.user_id &&
        new_roles == other.new_roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, new_roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoleRequest')
          ..add('user_id', user_id)
          ..add('new_roles', new_roles))
        .toString();
  }
}

class RoleRequestBuilder implements Builder<RoleRequest, RoleRequestBuilder> {
  _$RoleRequest? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  ListBuilder<TimedRole>? _new_roles;
  ListBuilder<TimedRole> get new_roles =>
      _$this._new_roles ??= new ListBuilder<TimedRole>();
  set new_roles(ListBuilder<TimedRole>? new_roles) =>
      _$this._new_roles = new_roles;

  RoleRequestBuilder();

  RoleRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _new_roles = $v.new_roles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoleRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoleRequest;
  }

  @override
  void update(void Function(RoleRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoleRequest build() => _build();

  _$RoleRequest _build() {
    _$RoleRequest _$result;
    try {
      _$result = _$v ??
          new _$RoleRequest._(
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'RoleRequest', 'user_id'),
              new_roles: new_roles.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'new_roles';
        new_roles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RoleRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
