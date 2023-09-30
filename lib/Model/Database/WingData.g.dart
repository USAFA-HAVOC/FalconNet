// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WingData.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WingData> _$wingDataSerializer = new _$WingDataSerializer();

class _$WingDataSerializer implements StructuredSerializer<WingData> {
  @override
  final Iterable<Type> types = const [WingData, _$WingData];
  @override
  final String wireName = 'WingData';

  @override
  Iterable<Object?> serialize(Serializers serializers, WingData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'units',
      serializers.serialize(object.units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UnitSummary)])),
    ];

    return result;
  }

  @override
  WingData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WingDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'units':
          result.units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UnitSummary)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WingData extends WingData {
  @override
  final BuiltList<UnitSummary> units;

  factory _$WingData([void Function(WingDataBuilder)? updates]) =>
      (new WingDataBuilder()..update(updates))._build();

  _$WingData._({required this.units}) : super._() {
    BuiltValueNullFieldError.checkNotNull(units, r'WingData', 'units');
  }

  @override
  WingData rebuild(void Function(WingDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WingDataBuilder toBuilder() => new WingDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WingData && units == other.units;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, units.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WingData')..add('units', units))
        .toString();
  }
}

class WingDataBuilder implements Builder<WingData, WingDataBuilder> {
  _$WingData? _$v;

  ListBuilder<UnitSummary>? _units;
  ListBuilder<UnitSummary> get units =>
      _$this._units ??= new ListBuilder<UnitSummary>();
  set units(ListBuilder<UnitSummary>? units) => _$this._units = units;

  WingDataBuilder();

  WingDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _units = $v.units.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WingData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WingData;
  }

  @override
  void update(void Function(WingDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WingData build() => _build();

  _$WingData _build() {
    _$WingData _$result;
    try {
      _$result = _$v ?? new _$WingData._(units: units.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'units';
        units.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WingData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
