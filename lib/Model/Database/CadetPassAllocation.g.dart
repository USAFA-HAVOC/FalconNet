// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CadetPassAllocation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CadetPassAllocation> _$cadetPassAllocationSerializer =
    new _$CadetPassAllocationSerializer();

class _$CadetPassAllocationSerializer
    implements StructuredSerializer<CadetPassAllocation> {
  @override
  final Iterable<Type> types = const [
    CadetPassAllocation,
    _$CadetPassAllocation
  ];
  @override
  final String wireName = 'CadetPassAllocation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CadetPassAllocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.weekend_overnight_passes;
    if (value != null) {
      result
        ..add('weekend_overnight_passes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekday_overnight_passes;
    if (value != null) {
      result
        ..add('weekday_overnight_passes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekday_day_passes;
    if (value != null) {
      result
        ..add('weekday_day_passes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.individual_pass_status;
    if (value != null) {
      result
        ..add('individual_pass_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.effective_pass_status;
    if (value != null) {
      result
        ..add('effective_pass_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CadetPassAllocation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetPassAllocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'weekend_overnight_passes':
          result.weekend_overnight_passes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weekday_overnight_passes':
          result.weekday_overnight_passes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weekday_day_passes':
          result.weekday_day_passes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'individual_pass_status':
          result.individual_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'effective_pass_status':
          result.effective_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CadetPassAllocation extends CadetPassAllocation {
  @override
  final int? weekend_overnight_passes;
  @override
  final int? weekday_overnight_passes;
  @override
  final int? weekday_day_passes;
  @override
  final String? individual_pass_status;
  @override
  final String? effective_pass_status;

  factory _$CadetPassAllocation(
          [void Function(CadetPassAllocationBuilder)? updates]) =>
      (new CadetPassAllocationBuilder()..update(updates))._build();

  _$CadetPassAllocation._(
      {this.weekend_overnight_passes,
      this.weekday_overnight_passes,
      this.weekday_day_passes,
      this.individual_pass_status,
      this.effective_pass_status})
      : super._();

  @override
  CadetPassAllocation rebuild(
          void Function(CadetPassAllocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetPassAllocationBuilder toBuilder() =>
      new CadetPassAllocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetPassAllocation &&
        weekend_overnight_passes == other.weekend_overnight_passes &&
        weekday_overnight_passes == other.weekday_overnight_passes &&
        weekday_day_passes == other.weekday_day_passes &&
        individual_pass_status == other.individual_pass_status &&
        effective_pass_status == other.effective_pass_status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weekend_overnight_passes.hashCode);
    _$hash = $jc(_$hash, weekday_overnight_passes.hashCode);
    _$hash = $jc(_$hash, weekday_day_passes.hashCode);
    _$hash = $jc(_$hash, individual_pass_status.hashCode);
    _$hash = $jc(_$hash, effective_pass_status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetPassAllocation')
          ..add('weekend_overnight_passes', weekend_overnight_passes)
          ..add('weekday_overnight_passes', weekday_overnight_passes)
          ..add('weekday_day_passes', weekday_day_passes)
          ..add('individual_pass_status', individual_pass_status)
          ..add('effective_pass_status', effective_pass_status))
        .toString();
  }
}

class CadetPassAllocationBuilder
    implements Builder<CadetPassAllocation, CadetPassAllocationBuilder> {
  _$CadetPassAllocation? _$v;

  int? _weekend_overnight_passes;
  int? get weekend_overnight_passes => _$this._weekend_overnight_passes;
  set weekend_overnight_passes(int? weekend_overnight_passes) =>
      _$this._weekend_overnight_passes = weekend_overnight_passes;

  int? _weekday_overnight_passes;
  int? get weekday_overnight_passes => _$this._weekday_overnight_passes;
  set weekday_overnight_passes(int? weekday_overnight_passes) =>
      _$this._weekday_overnight_passes = weekday_overnight_passes;

  int? _weekday_day_passes;
  int? get weekday_day_passes => _$this._weekday_day_passes;
  set weekday_day_passes(int? weekday_day_passes) =>
      _$this._weekday_day_passes = weekday_day_passes;

  String? _individual_pass_status;
  String? get individual_pass_status => _$this._individual_pass_status;
  set individual_pass_status(String? individual_pass_status) =>
      _$this._individual_pass_status = individual_pass_status;

  String? _effective_pass_status;
  String? get effective_pass_status => _$this._effective_pass_status;
  set effective_pass_status(String? effective_pass_status) =>
      _$this._effective_pass_status = effective_pass_status;

  CadetPassAllocationBuilder();

  CadetPassAllocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weekend_overnight_passes = $v.weekend_overnight_passes;
      _weekday_overnight_passes = $v.weekday_overnight_passes;
      _weekday_day_passes = $v.weekday_day_passes;
      _individual_pass_status = $v.individual_pass_status;
      _effective_pass_status = $v.effective_pass_status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetPassAllocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetPassAllocation;
  }

  @override
  void update(void Function(CadetPassAllocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetPassAllocation build() => _build();

  _$CadetPassAllocation _build() {
    final _$result = _$v ??
        new _$CadetPassAllocation._(
            weekend_overnight_passes: weekend_overnight_passes,
            weekday_overnight_passes: weekday_overnight_passes,
            weekday_day_passes: weekday_day_passes,
            individual_pass_status: individual_pass_status,
            effective_pass_status: effective_pass_status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
