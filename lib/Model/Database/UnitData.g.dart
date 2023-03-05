// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitData.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitData> _$unitDataSerializer = new _$UnitDataSerializer();

class _$UnitDataSerializer implements StructuredSerializer<UnitData> {
  @override
  final Iterable<Type> types = const [UnitData, _$UnitData];
  @override
  final String wireName = 'UnitData';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'signed',
      serializers.serialize(object.signed, specifiedType: const FullType(int)),
      'unsigned',
      serializers.serialize(object.unsigned,
          specifiedType: const FullType(int)),
      'out',
      serializers.serialize(object.out, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(Unit)),
      'members',
      serializers.serialize(object.members,
          specifiedType:
              const FullType(BuiltList, const [const FullType(User)])),
    ];

    return result;
  }

  @override
  UnitData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'signed':
          result.signed = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unsigned':
          result.unsigned = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'out':
          result.out = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unit':
          result.unit.replace(serializers.deserialize(value,
              specifiedType: const FullType(Unit))! as Unit);
          break;
        case 'members':
          result.members.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(User)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UnitData extends UnitData {
  @override
  final int signed;
  @override
  final int unsigned;
  @override
  final int out;
  @override
  final int total;
  @override
  final Unit unit;
  @override
  final BuiltList<User> members;

  factory _$UnitData([void Function(UnitDataBuilder)? updates]) =>
      (new UnitDataBuilder()..update(updates))._build();

  _$UnitData._(
      {required this.signed,
      required this.unsigned,
      required this.out,
      required this.total,
      required this.unit,
      required this.members})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(signed, r'UnitData', 'signed');
    BuiltValueNullFieldError.checkNotNull(unsigned, r'UnitData', 'unsigned');
    BuiltValueNullFieldError.checkNotNull(out, r'UnitData', 'out');
    BuiltValueNullFieldError.checkNotNull(total, r'UnitData', 'total');
    BuiltValueNullFieldError.checkNotNull(unit, r'UnitData', 'unit');
    BuiltValueNullFieldError.checkNotNull(members, r'UnitData', 'members');
  }

  @override
  UnitData rebuild(void Function(UnitDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitDataBuilder toBuilder() => new UnitDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitData &&
        signed == other.signed &&
        unsigned == other.unsigned &&
        out == other.out &&
        total == other.total &&
        unit == other.unit &&
        members == other.members;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signed.hashCode);
    _$hash = $jc(_$hash, unsigned.hashCode);
    _$hash = $jc(_$hash, out.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitData')
          ..add('signed', signed)
          ..add('unsigned', unsigned)
          ..add('out', out)
          ..add('total', total)
          ..add('unit', unit)
          ..add('members', members))
        .toString();
  }
}

class UnitDataBuilder implements Builder<UnitData, UnitDataBuilder> {
  _$UnitData? _$v;

  int? _signed;
  int? get signed => _$this._signed;
  set signed(int? signed) => _$this._signed = signed;

  int? _unsigned;
  int? get unsigned => _$this._unsigned;
  set unsigned(int? unsigned) => _$this._unsigned = unsigned;

  int? _out;
  int? get out => _$this._out;
  set out(int? out) => _$this._out = out;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  UnitBuilder? _unit;
  UnitBuilder get unit => _$this._unit ??= new UnitBuilder();
  set unit(UnitBuilder? unit) => _$this._unit = unit;

  ListBuilder<User>? _members;
  ListBuilder<User> get members => _$this._members ??= new ListBuilder<User>();
  set members(ListBuilder<User>? members) => _$this._members = members;

  UnitDataBuilder();

  UnitDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signed = $v.signed;
      _unsigned = $v.unsigned;
      _out = $v.out;
      _total = $v.total;
      _unit = $v.unit.toBuilder();
      _members = $v.members.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitData;
  }

  @override
  void update(void Function(UnitDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitData build() => _build();

  _$UnitData _build() {
    _$UnitData _$result;
    try {
      _$result = _$v ??
          new _$UnitData._(
              signed: BuiltValueNullFieldError.checkNotNull(
                  signed, r'UnitData', 'signed'),
              unsigned: BuiltValueNullFieldError.checkNotNull(
                  unsigned, r'UnitData', 'unsigned'),
              out: BuiltValueNullFieldError.checkNotNull(
                  out, r'UnitData', 'out'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'UnitData', 'total'),
              unit: unit.build(),
              members: members.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unit';
        unit.build();
        _$failedField = 'members';
        members.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UnitData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
