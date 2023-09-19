// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitSummary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitSummary> _$unitSummarySerializer = new _$UnitSummarySerializer();

class _$UnitSummarySerializer implements StructuredSerializer<UnitSummary> {
  @override
  final Iterable<Type> types = const [UnitSummary, _$UnitSummary];
  @override
  final String wireName = 'UnitSummary';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitSummary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(Unit)),
    ];
    Object? value;
    value = object.signed;
    if (value != null) {
      result
        ..add('signed')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.unsigned;
    if (value != null) {
      result
        ..add('unsigned')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.out;
    if (value != null) {
      result
        ..add('out')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.leave;
    if (value != null) {
      result
        ..add('leave')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.overdue;
    if (value != null) {
      result
        ..add('overdue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.excused;
    if (value != null) {
      result
        ..add('excused')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.out_returning;
    if (value != null) {
      result
        ..add('out_returning')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UnitSummary deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitSummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'signed':
          result.signed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'unsigned':
          result.unsigned = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'out':
          result.out = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'leave':
          result.leave = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'overdue':
          result.overdue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'excused':
          result.excused = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'out_returning':
          result.out_returning = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'unit':
          result.unit.replace(serializers.deserialize(value,
              specifiedType: const FullType(Unit))! as Unit);
          break;
      }
    }

    return result.build();
  }
}

class _$UnitSummary extends UnitSummary {
  @override
  final int? signed;
  @override
  final int? unsigned;
  @override
  final int? out;
  @override
  final int? leave;
  @override
  final int? overdue;
  @override
  final int? excused;
  @override
  final int? out_returning;
  @override
  final int? total;
  @override
  final Unit unit;

  factory _$UnitSummary([void Function(UnitSummaryBuilder)? updates]) =>
      (new UnitSummaryBuilder()..update(updates))._build();

  _$UnitSummary._(
      {this.signed,
      this.unsigned,
      this.out,
      this.leave,
      this.overdue,
      this.excused,
      this.out_returning,
      this.total,
      required this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(unit, r'UnitSummary', 'unit');
  }

  @override
  UnitSummary rebuild(void Function(UnitSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitSummaryBuilder toBuilder() => new UnitSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitSummary &&
        signed == other.signed &&
        unsigned == other.unsigned &&
        out == other.out &&
        leave == other.leave &&
        overdue == other.overdue &&
        excused == other.excused &&
        out_returning == other.out_returning &&
        total == other.total &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signed.hashCode);
    _$hash = $jc(_$hash, unsigned.hashCode);
    _$hash = $jc(_$hash, out.hashCode);
    _$hash = $jc(_$hash, leave.hashCode);
    _$hash = $jc(_$hash, overdue.hashCode);
    _$hash = $jc(_$hash, excused.hashCode);
    _$hash = $jc(_$hash, out_returning.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitSummary')
          ..add('signed', signed)
          ..add('unsigned', unsigned)
          ..add('out', out)
          ..add('leave', leave)
          ..add('overdue', overdue)
          ..add('excused', excused)
          ..add('out_returning', out_returning)
          ..add('total', total)
          ..add('unit', unit))
        .toString();
  }
}

class UnitSummaryBuilder implements Builder<UnitSummary, UnitSummaryBuilder> {
  _$UnitSummary? _$v;

  int? _signed;
  int? get signed => _$this._signed;
  set signed(int? signed) => _$this._signed = signed;

  int? _unsigned;
  int? get unsigned => _$this._unsigned;
  set unsigned(int? unsigned) => _$this._unsigned = unsigned;

  int? _out;
  int? get out => _$this._out;
  set out(int? out) => _$this._out = out;

  int? _leave;
  int? get leave => _$this._leave;
  set leave(int? leave) => _$this._leave = leave;

  int? _overdue;
  int? get overdue => _$this._overdue;
  set overdue(int? overdue) => _$this._overdue = overdue;

  int? _excused;
  int? get excused => _$this._excused;
  set excused(int? excused) => _$this._excused = excused;

  int? _out_returning;
  int? get out_returning => _$this._out_returning;
  set out_returning(int? out_returning) =>
      _$this._out_returning = out_returning;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  UnitBuilder? _unit;
  UnitBuilder get unit => _$this._unit ??= new UnitBuilder();
  set unit(UnitBuilder? unit) => _$this._unit = unit;

  UnitSummaryBuilder();

  UnitSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signed = $v.signed;
      _unsigned = $v.unsigned;
      _out = $v.out;
      _leave = $v.leave;
      _overdue = $v.overdue;
      _excused = $v.excused;
      _out_returning = $v.out_returning;
      _total = $v.total;
      _unit = $v.unit.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitSummary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitSummary;
  }

  @override
  void update(void Function(UnitSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitSummary build() => _build();

  _$UnitSummary _build() {
    _$UnitSummary _$result;
    try {
      _$result = _$v ??
          new _$UnitSummary._(
              signed: signed,
              unsigned: unsigned,
              out: out,
              leave: leave,
              overdue: overdue,
              excused: excused,
              out_returning: out_returning,
              total: total,
              unit: unit.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unit';
        unit.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UnitSummary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
