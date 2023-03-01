// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitAssignRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitAssignRequest> _$unitAssignRequestSerializer =
    new _$UnitAssignRequestSerializer();

class _$UnitAssignRequestSerializer
    implements StructuredSerializer<UnitAssignRequest> {
  @override
  final Iterable<Type> types = const [UnitAssignRequest, _$UnitAssignRequest];
  @override
  final String wireName = 'UnitAssignRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitAssignRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UnitAssignRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitAssignRequestBuilder();

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
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitAssignRequest extends UnitAssignRequest {
  @override
  final BuiltList<String> users;
  @override
  final String unit;

  factory _$UnitAssignRequest(
          [void Function(UnitAssignRequestBuilder)? updates]) =>
      (new UnitAssignRequestBuilder()..update(updates))._build();

  _$UnitAssignRequest._({required this.users, required this.unit}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, r'UnitAssignRequest', 'users');
    BuiltValueNullFieldError.checkNotNull(unit, r'UnitAssignRequest', 'unit');
  }

  @override
  UnitAssignRequest rebuild(void Function(UnitAssignRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitAssignRequestBuilder toBuilder() =>
      new UnitAssignRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitAssignRequest &&
        users == other.users &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitAssignRequest')
          ..add('users', users)
          ..add('unit', unit))
        .toString();
  }
}

class UnitAssignRequestBuilder
    implements Builder<UnitAssignRequest, UnitAssignRequestBuilder> {
  _$UnitAssignRequest? _$v;

  ListBuilder<String>? _users;
  ListBuilder<String> get users => _$this._users ??= new ListBuilder<String>();
  set users(ListBuilder<String>? users) => _$this._users = users;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  UnitAssignRequestBuilder();

  UnitAssignRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitAssignRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitAssignRequest;
  }

  @override
  void update(void Function(UnitAssignRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitAssignRequest build() => _build();

  _$UnitAssignRequest _build() {
    _$UnitAssignRequest _$result;
    try {
      _$result = _$v ??
          new _$UnitAssignRequest._(
              users: users.build(),
              unit: BuiltValueNullFieldError.checkNotNull(
                  unit, r'UnitAssignRequest', 'unit'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UnitAssignRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
