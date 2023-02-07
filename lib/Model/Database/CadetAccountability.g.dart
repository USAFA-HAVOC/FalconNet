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
    final result = <Object?>[];
    Object? value;
    value = object.di_last_signed;
    if (value != null) {
      result
        ..add('di_last_signed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.di_signed_by;
    if (value != null) {
      result
        ..add('di_signed_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
        case 'di_last_signed':
          result.di_last_signed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'di_signed_by':
          result.di_signed_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'current_pass':
          result.current_pass.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetPass))! as CadetPass);
          break;
        case 'current_leave':
          result.current_leave.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetLeave))! as CadetLeave);
          break;
      }
    }

    return result.build();
  }
}

class _$CadetAccountability extends CadetAccountability {
  @override
  final DateTime? di_last_signed;
  @override
  final String? di_signed_by;
  @override
  final CadetPass? current_pass;
  @override
  final CadetLeave? current_leave;

  factory _$CadetAccountability(
          [void Function(CadetAccountabilityBuilder)? updates]) =>
      (new CadetAccountabilityBuilder()..update(updates))._build();

  _$CadetAccountability._(
      {this.di_last_signed,
      this.di_signed_by,
      this.current_pass,
      this.current_leave})
      : super._();

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
        di_last_signed == other.di_last_signed &&
        di_signed_by == other.di_signed_by &&
        current_pass == other.current_pass &&
        current_leave == other.current_leave;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, di_last_signed.hashCode);
    _$hash = $jc(_$hash, di_signed_by.hashCode);
    _$hash = $jc(_$hash, current_pass.hashCode);
    _$hash = $jc(_$hash, current_leave.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetAccountability')
          ..add('di_last_signed', di_last_signed)
          ..add('di_signed_by', di_signed_by)
          ..add('current_pass', current_pass)
          ..add('current_leave', current_leave))
        .toString();
  }
}

class CadetAccountabilityBuilder
    implements Builder<CadetAccountability, CadetAccountabilityBuilder> {
  _$CadetAccountability? _$v;

  DateTime? _di_last_signed;
  DateTime? get di_last_signed => _$this._di_last_signed;
  set di_last_signed(DateTime? di_last_signed) =>
      _$this._di_last_signed = di_last_signed;

  String? _di_signed_by;
  String? get di_signed_by => _$this._di_signed_by;
  set di_signed_by(String? di_signed_by) => _$this._di_signed_by = di_signed_by;

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

  CadetAccountabilityBuilder();

  CadetAccountabilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _di_last_signed = $v.di_last_signed;
      _di_signed_by = $v.di_signed_by;
      _current_pass = $v.current_pass?.toBuilder();
      _current_leave = $v.current_leave?.toBuilder();
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
              di_last_signed: di_last_signed,
              di_signed_by: di_signed_by,
              current_pass: _current_pass?.build(),
              current_leave: _current_leave?.build());
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
