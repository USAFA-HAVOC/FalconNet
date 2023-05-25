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
      'units',
      serializers.serialize(object.units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'assigned_unit',
      serializers.serialize(object.assigned_unit,
          specifiedType: const FullType(String)),
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
        case 'units':
          result.units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'assigned_unit':
          result.assigned_unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitAssignRequest extends UnitAssignRequest {
  @override
  final BuiltList<String> units;
  @override
  final String user;
  @override
  final String assigned_unit;

  factory _$UnitAssignRequest(
          [void Function(UnitAssignRequestBuilder)? updates]) =>
      (new UnitAssignRequestBuilder()..update(updates))._build();

  _$UnitAssignRequest._(
      {required this.units, required this.user, required this.assigned_unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(units, r'UnitAssignRequest', 'units');
    BuiltValueNullFieldError.checkNotNull(user, r'UnitAssignRequest', 'user');
    BuiltValueNullFieldError.checkNotNull(
        assigned_unit, r'UnitAssignRequest', 'assigned_unit');
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
        units == other.units &&
        user == other.user &&
        assigned_unit == other.assigned_unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, units.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, assigned_unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitAssignRequest')
          ..add('units', units)
          ..add('user', user)
          ..add('assigned_unit', assigned_unit))
        .toString();
  }
}

class UnitAssignRequestBuilder
    implements Builder<UnitAssignRequest, UnitAssignRequestBuilder> {
  _$UnitAssignRequest? _$v;

  ListBuilder<String>? _units;
  ListBuilder<String> get units => _$this._units ??= new ListBuilder<String>();
  set units(ListBuilder<String>? units) => _$this._units = units;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  String? _assigned_unit;
  String? get assigned_unit => _$this._assigned_unit;
  set assigned_unit(String? assigned_unit) =>
      _$this._assigned_unit = assigned_unit;

  UnitAssignRequestBuilder();

  UnitAssignRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _units = $v.units.toBuilder();
      _user = $v.user;
      _assigned_unit = $v.assigned_unit;
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
              units: units.build(),
              user: BuiltValueNullFieldError.checkNotNull(
                  user, r'UnitAssignRequest', 'user'),
              assigned_unit: BuiltValueNullFieldError.checkNotNull(
                  assigned_unit, r'UnitAssignRequest', 'assigned_unit'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'units';
        units.build();
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
