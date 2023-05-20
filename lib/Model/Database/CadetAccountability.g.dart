// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CadetAccountability.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CadetAccountability> _$cadetAccountabilitySerializer =
    new _$CadetAccountabilitySerializer();

class _$CadetAccountabilitySerializer
    implements StructuredSerializer<CadetAccountability> {
  @override
  final Iterable<Type> types = const [
    CadetAccountability,
    _$CadetAccountability
  ];
  @override
  final String wireName = 'CadetAccountability';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CadetAccountability object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'individual_pass_status',
      serializers.serialize(object.individual_pass_status,
          specifiedType: const FullType(bool)),
      'effective_pass_status',
      serializers.serialize(object.effective_pass_status,
          specifiedType: const FullType(bool)),
      'class_year_idx',
      serializers.serialize(object.class_year_idx,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.current_pass;
    if (value != null) {
      result
        ..add('current_pass')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetPass)));
    }
    value = object.current_leave;
    if (value != null) {
      result
        ..add('current_leave')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetLeave)));
    }
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
    return result;
  }

  @override
  CadetAccountability deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetAccountabilityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'current_pass':
          result.current_pass.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetPass))! as CadetPass);
          break;
        case 'current_leave':
          result.current_leave.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetLeave))! as CadetLeave);
          break;
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
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'effective_pass_status':
          result.effective_pass_status = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'class_year_idx':
          result.class_year_idx = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CadetAccountability extends CadetAccountability {
  @override
  final CadetPass? current_pass;
  @override
  final CadetLeave? current_leave;
  @override
  final int? weekend_overnight_passes;
  @override
  final int? weekday_overnight_passes;
  @override
  final int? weekday_day_passes;
  @override
  final bool individual_pass_status;
  @override
  final bool effective_pass_status;
  @override
  final int class_year_idx;

  factory _$CadetAccountability(
          [void Function(CadetAccountabilityBuilder)? updates]) =>
      (new CadetAccountabilityBuilder()..update(updates))._build();

  _$CadetAccountability._(
      {this.current_pass,
      this.current_leave,
      this.weekend_overnight_passes,
      this.weekday_overnight_passes,
      this.weekday_day_passes,
      required this.individual_pass_status,
      required this.effective_pass_status,
      required this.class_year_idx})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(individual_pass_status,
        r'CadetAccountability', 'individual_pass_status');
    BuiltValueNullFieldError.checkNotNull(
        effective_pass_status, r'CadetAccountability', 'effective_pass_status');
    BuiltValueNullFieldError.checkNotNull(
        class_year_idx, r'CadetAccountability', 'class_year_idx');
  }

  @override
  CadetAccountability rebuild(
          void Function(CadetAccountabilityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetAccountabilityBuilder toBuilder() =>
      new CadetAccountabilityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetAccountability &&
        current_pass == other.current_pass &&
        current_leave == other.current_leave &&
        weekend_overnight_passes == other.weekend_overnight_passes &&
        weekday_overnight_passes == other.weekday_overnight_passes &&
        weekday_day_passes == other.weekday_day_passes &&
        individual_pass_status == other.individual_pass_status &&
        effective_pass_status == other.effective_pass_status &&
        class_year_idx == other.class_year_idx;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, current_pass.hashCode);
    _$hash = $jc(_$hash, current_leave.hashCode);
    _$hash = $jc(_$hash, weekend_overnight_passes.hashCode);
    _$hash = $jc(_$hash, weekday_overnight_passes.hashCode);
    _$hash = $jc(_$hash, weekday_day_passes.hashCode);
    _$hash = $jc(_$hash, individual_pass_status.hashCode);
    _$hash = $jc(_$hash, effective_pass_status.hashCode);
    _$hash = $jc(_$hash, class_year_idx.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetAccountability')
          ..add('current_pass', current_pass)
          ..add('current_leave', current_leave)
          ..add('weekend_overnight_passes', weekend_overnight_passes)
          ..add('weekday_overnight_passes', weekday_overnight_passes)
          ..add('weekday_day_passes', weekday_day_passes)
          ..add('individual_pass_status', individual_pass_status)
          ..add('effective_pass_status', effective_pass_status)
          ..add('class_year_idx', class_year_idx))
        .toString();
  }
}

class CadetAccountabilityBuilder
    implements Builder<CadetAccountability, CadetAccountabilityBuilder> {
  _$CadetAccountability? _$v;

  CadetPassBuilder? _current_pass;
  CadetPassBuilder get current_pass =>
      _$this._current_pass ??= new CadetPassBuilder();
  set current_pass(CadetPassBuilder? current_pass) =>
      _$this._current_pass = current_pass;

  CadetLeaveBuilder? _current_leave;
  CadetLeaveBuilder get current_leave =>
      _$this._current_leave ??= new CadetLeaveBuilder();
  set current_leave(CadetLeaveBuilder? current_leave) =>
      _$this._current_leave = current_leave;

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

  bool? _individual_pass_status;
  bool? get individual_pass_status => _$this._individual_pass_status;
  set individual_pass_status(bool? individual_pass_status) =>
      _$this._individual_pass_status = individual_pass_status;

  bool? _effective_pass_status;
  bool? get effective_pass_status => _$this._effective_pass_status;
  set effective_pass_status(bool? effective_pass_status) =>
      _$this._effective_pass_status = effective_pass_status;

  int? _class_year_idx;
  int? get class_year_idx => _$this._class_year_idx;
  set class_year_idx(int? class_year_idx) =>
      _$this._class_year_idx = class_year_idx;

  CadetAccountabilityBuilder();

  CadetAccountabilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _current_pass = $v.current_pass?.toBuilder();
      _current_leave = $v.current_leave?.toBuilder();
      _weekend_overnight_passes = $v.weekend_overnight_passes;
      _weekday_overnight_passes = $v.weekday_overnight_passes;
      _weekday_day_passes = $v.weekday_day_passes;
      _individual_pass_status = $v.individual_pass_status;
      _effective_pass_status = $v.effective_pass_status;
      _class_year_idx = $v.class_year_idx;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetAccountability other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetAccountability;
  }

  @override
  void update(void Function(CadetAccountabilityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetAccountability build() => _build();

  _$CadetAccountability _build() {
    _$CadetAccountability _$result;
    try {
      _$result = _$v ??
          new _$CadetAccountability._(
              current_pass: _current_pass?.build(),
              current_leave: _current_leave?.build(),
              weekend_overnight_passes: weekend_overnight_passes,
              weekday_overnight_passes: weekday_overnight_passes,
              weekday_day_passes: weekday_day_passes,
              individual_pass_status: BuiltValueNullFieldError.checkNotNull(
                  individual_pass_status,
                  r'CadetAccountability',
                  'individual_pass_status'),
              effective_pass_status: BuiltValueNullFieldError.checkNotNull(
                  effective_pass_status,
                  r'CadetAccountability',
                  'effective_pass_status'),
              class_year_idx: BuiltValueNullFieldError.checkNotNull(
                  class_year_idx, r'CadetAccountability', 'class_year_idx'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'current_pass';
        _current_pass?.build();
        _$failedField = 'current_leave';
        _current_leave?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CadetAccountability', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
