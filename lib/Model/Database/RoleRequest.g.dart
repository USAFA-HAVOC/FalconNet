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
      'roles_to_add',
      serializers.serialize(object.roles_to_add,
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
        case 'roles_to_add':
          result.roles_to_add.replace(serializers.deserialize(value,
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
  final BuiltList<TimedRole> roles_to_add;

  factory _$RoleRequest([void Function(RoleRequestBuilder)? updates]) =>
      (new RoleRequestBuilder()..update(updates))._build();

  _$RoleRequest._({required this.user_id, required this.roles_to_add})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'RoleRequest', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        roles_to_add, r'RoleRequest', 'roles_to_add');
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
        roles_to_add == other.roles_to_add;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, roles_to_add.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoleRequest')
          ..add('user_id', user_id)
          ..add('roles_to_add', roles_to_add))
        .toString();
  }
}

class RoleRequestBuilder implements Builder<RoleRequest, RoleRequestBuilder> {
  _$RoleRequest? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  ListBuilder<TimedRole>? _roles_to_add;
  ListBuilder<TimedRole> get roles_to_add =>
      _$this._roles_to_add ??= new ListBuilder<TimedRole>();
  set roles_to_add(ListBuilder<TimedRole>? roles_to_add) =>
      _$this._roles_to_add = roles_to_add;

  RoleRequestBuilder();

  RoleRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _roles_to_add = $v.roles_to_add.toBuilder();
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
              roles_to_add: roles_to_add.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles_to_add';
        roles_to_add.build();
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
