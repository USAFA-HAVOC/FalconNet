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
      'out_returning',
      serializers.serialize(object.out_returning,
          specifiedType: const FullType(int)),
      'overdue',
      serializers.serialize(object.overdue, specifiedType: const FullType(int)),
      'excused',
      serializers.serialize(object.excused, specifiedType: const FullType(int)),
      'leave',
      serializers.serialize(object.leave, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(Unit)),
      'members',
      serializers.serialize(object.members,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserSummary)])),
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
        case 'out_returning':
          result.out_returning = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'overdue':
          result.overdue = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'excused':
          result.excused = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'leave':
          result.leave = serializers.deserialize(value,
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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserSummary)]))!
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
  final int out_returning;
  @override
  final int overdue;
  @override
  final int excused;
  @override
  final int leave;
  @override
  final int total;
  @override
  final Unit unit;
  @override
  final BuiltList<UserSummary> members;

  factory _$UnitData([void Function(UnitDataBuilder)? updates]) =>
      (new UnitDataBuilder()..update(updates))._build();

  _$UnitData._(
      {required this.signed,
      required this.unsigned,
      required this.out,
      required this.out_returning,
      required this.overdue,
      required this.excused,
      required this.leave,
      required this.total,
      required this.unit,
      required this.members})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(signed, r'UnitData', 'signed');
    BuiltValueNullFieldError.checkNotNull(unsigned, r'UnitData', 'unsigned');
    BuiltValueNullFieldError.checkNotNull(out, r'UnitData', 'out');
    BuiltValueNullFieldError.checkNotNull(
        out_returning, r'UnitData', 'out_returning');
    BuiltValueNullFieldError.checkNotNull(overdue, r'UnitData', 'overdue');
    BuiltValueNullFieldError.checkNotNull(excused, r'UnitData', 'excused');
    BuiltValueNullFieldError.checkNotNull(leave, r'UnitData', 'leave');
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
        out_returning == other.out_returning &&
        overdue == other.overdue &&
        excused == other.excused &&
        leave == other.leave &&
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
    _$hash = $jc(_$hash, out_returning.hashCode);
    _$hash = $jc(_$hash, overdue.hashCode);
    _$hash = $jc(_$hash, excused.hashCode);
    _$hash = $jc(_$hash, leave.hashCode);
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
          ..add('out_returning', out_returning)
          ..add('overdue', overdue)
          ..add('excused', excused)
          ..add('leave', leave)
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

  int? _out_returning;
  int? get out_returning => _$this._out_returning;
  set out_returning(int? out_returning) =>
      _$this._out_returning = out_returning;

  int? _overdue;
  int? get overdue => _$this._overdue;
  set overdue(int? overdue) => _$this._overdue = overdue;

  int? _excused;
  int? get excused => _$this._excused;
  set excused(int? excused) => _$this._excused = excused;

  int? _leave;
  int? get leave => _$this._leave;
  set leave(int? leave) => _$this._leave = leave;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  UnitBuilder? _unit;
  UnitBuilder get unit => _$this._unit ??= new UnitBuilder();
  set unit(UnitBuilder? unit) => _$this._unit = unit;

  ListBuilder<UserSummary>? _members;
  ListBuilder<UserSummary> get members =>
      _$this._members ??= new ListBuilder<UserSummary>();
  set members(ListBuilder<UserSummary>? members) => _$this._members = members;

  UnitDataBuilder();

  UnitDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signed = $v.signed;
      _unsigned = $v.unsigned;
      _out = $v.out;
      _out_returning = $v.out_returning;
      _overdue = $v.overdue;
      _excused = $v.excused;
      _leave = $v.leave;
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
              out_returning: BuiltValueNullFieldError.checkNotNull(
                  out_returning, r'UnitData', 'out_returning'),
              overdue: BuiltValueNullFieldError.checkNotNull(
                  overdue, r'UnitData', 'overdue'),
              excused: BuiltValueNullFieldError.checkNotNull(
                  excused, r'UnitData', 'excused'),
              leave: BuiltValueNullFieldError.checkNotNull(
                  leave, r'UnitData', 'leave'),
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
