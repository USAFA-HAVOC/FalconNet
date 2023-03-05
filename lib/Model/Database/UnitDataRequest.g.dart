// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitDataRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitDataRequest> _$unitDataRequestSerializer =
    new _$UnitDataRequestSerializer();

class _$UnitDataRequestSerializer
    implements StructuredSerializer<UnitDataRequest> {
  @override
  final Iterable<Type> types = const [UnitDataRequest, _$UnitDataRequest];
  @override
  final String wireName = 'UnitDataRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitDataRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UnitDataRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitDataRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitDataRequest extends UnitDataRequest {
  @override
  final String unit;

  factory _$UnitDataRequest([void Function(UnitDataRequestBuilder)? updates]) =>
      (new UnitDataRequestBuilder()..update(updates))._build();

  _$UnitDataRequest._({required this.unit}) : super._() {
    BuiltValueNullFieldError.checkNotNull(unit, r'UnitDataRequest', 'unit');
  }

  @override
  UnitDataRequest rebuild(void Function(UnitDataRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitDataRequestBuilder toBuilder() =>
      new UnitDataRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitDataRequest && unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitDataRequest')..add('unit', unit))
        .toString();
  }
}

class UnitDataRequestBuilder
    implements Builder<UnitDataRequest, UnitDataRequestBuilder> {
  _$UnitDataRequest? _$v;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  UnitDataRequestBuilder();

  UnitDataRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitDataRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitDataRequest;
  }

  @override
  void update(void Function(UnitDataRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitDataRequest build() => _build();

  _$UnitDataRequest _build() {
    final _$result = _$v ??
        new _$UnitDataRequest._(
            unit: BuiltValueNullFieldError.checkNotNull(
                unit, r'UnitDataRequest', 'unit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
