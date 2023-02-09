// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitOrder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitOrder> _$unitOrderSerializer = new _$UnitOrderSerializer();

class _$UnitOrderSerializer implements StructuredSerializer<UnitOrder> {
  @override
  final Iterable<Type> types = const [UnitOrder, _$UnitOrder];
  @override
  final String wireName = 'UnitOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'regular',
      serializers.serialize(object.regular, specifiedType: const FullType(int)),
      'vegetarian',
      serializers.serialize(object.vegetarian,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UnitOrder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'regular':
          result.regular = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'vegetarian':
          result.vegetarian = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitOrder extends UnitOrder {
  @override
  final int regular;
  @override
  final int vegetarian;

  factory _$UnitOrder([void Function(UnitOrderBuilder)? updates]) =>
      (new UnitOrderBuilder()..update(updates))._build();

  _$UnitOrder._({required this.regular, required this.vegetarian}) : super._() {
    BuiltValueNullFieldError.checkNotNull(regular, r'UnitOrder', 'regular');
    BuiltValueNullFieldError.checkNotNull(
        vegetarian, r'UnitOrder', 'vegetarian');
  }

  @override
  UnitOrder rebuild(void Function(UnitOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitOrderBuilder toBuilder() => new UnitOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitOrder &&
        regular == other.regular &&
        vegetarian == other.vegetarian;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, regular.hashCode);
    _$hash = $jc(_$hash, vegetarian.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitOrder')
          ..add('regular', regular)
          ..add('vegetarian', vegetarian))
        .toString();
  }
}

class UnitOrderBuilder implements Builder<UnitOrder, UnitOrderBuilder> {
  _$UnitOrder? _$v;

  int? _regular;
  int? get regular => _$this._regular;
  set regular(int? regular) => _$this._regular = regular;

  int? _vegetarian;
  int? get vegetarian => _$this._vegetarian;
  set vegetarian(int? vegetarian) => _$this._vegetarian = vegetarian;

  UnitOrderBuilder();

  UnitOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _regular = $v.regular;
      _vegetarian = $v.vegetarian;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitOrder;
  }

  @override
  void update(void Function(UnitOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitOrder build() => _build();

  _$UnitOrder _build() {
    final _$result = _$v ??
        new _$UnitOrder._(
            regular: BuiltValueNullFieldError.checkNotNull(
                regular, r'UnitOrder', 'regular'),
            vegetarian: BuiltValueNullFieldError.checkNotNull(
                vegetarian, r'UnitOrder', 'vegetarian'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
