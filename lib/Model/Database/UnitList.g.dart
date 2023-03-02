// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitList.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitList> _$unitListSerializer = new _$UnitListSerializer();

class _$UnitListSerializer implements StructuredSerializer<UnitList> {
  @override
  final Iterable<Type> types = const [UnitList, _$UnitList];
  @override
  final String wireName = 'UnitList';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'units',
      serializers.serialize(object.units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  UnitList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitListBuilder();

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
      }
    }

    return result.build();
  }
}

class _$UnitList extends UnitList {
  @override
  final BuiltList<String> units;

  factory _$UnitList([void Function(UnitListBuilder)? updates]) =>
      (new UnitListBuilder()..update(updates))._build();

  _$UnitList._({required this.units}) : super._() {
    BuiltValueNullFieldError.checkNotNull(units, r'UnitList', 'units');
  }

  @override
  UnitList rebuild(void Function(UnitListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitListBuilder toBuilder() => new UnitListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitList && units == other.units;
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
    return (newBuiltValueToStringHelper(r'UnitList')..add('units', units))
        .toString();
  }
}

class UnitListBuilder implements Builder<UnitList, UnitListBuilder> {
  _$UnitList? _$v;

  ListBuilder<String>? _units;
  ListBuilder<String> get units => _$this._units ??= new ListBuilder<String>();
  set units(ListBuilder<String>? units) => _$this._units = units;

  UnitListBuilder();

  UnitListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _units = $v.units.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitList;
  }

  @override
  void update(void Function(UnitListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitList build() => _build();

  _$UnitList _build() {
    _$UnitList _$result;
    try {
      _$result = _$v ?? new _$UnitList._(units: units.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'units';
        units.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UnitList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
