// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CadetDI.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CadetDI> _$cadetDISerializer = new _$CadetDISerializer();

class _$CadetDISerializer implements StructuredSerializer<CadetDI> {
  @override
  final Iterable<Type> types = const [CadetDI, _$CadetDI];
  @override
  final String wireName = 'CadetDI';

  @override
  Iterable<Object?> serialize(Serializers serializers, CadetDI object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.last_signed;
    if (value != null) {
      result
        ..add('last_signed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.signed_by;
    if (value != null) {
      result
        ..add('signed_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CadetDI deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CadetDIBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'last_signed':
          result.last_signed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'signed_by':
          result.signed_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CadetDI extends CadetDI {
  @override
  final DateTime? last_signed;
  @override
  final String? signed_by;

  factory _$CadetDI([void Function(CadetDIBuilder)? updates]) =>
      (new CadetDIBuilder()..update(updates))._build();

  _$CadetDI._({this.last_signed, this.signed_by}) : super._();

  @override
  CadetDI rebuild(void Function(CadetDIBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CadetDIBuilder toBuilder() => new CadetDIBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CadetDI &&
        last_signed == other.last_signed &&
        signed_by == other.signed_by;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, last_signed.hashCode);
    _$hash = $jc(_$hash, signed_by.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CadetDI')
          ..add('last_signed', last_signed)
          ..add('signed_by', signed_by))
        .toString();
  }
}

class CadetDIBuilder implements Builder<CadetDI, CadetDIBuilder> {
  _$CadetDI? _$v;

  DateTime? _last_signed;
  DateTime? get last_signed => _$this._last_signed;
  set last_signed(DateTime? last_signed) => _$this._last_signed = last_signed;

  String? _signed_by;
  String? get signed_by => _$this._signed_by;
  set signed_by(String? signed_by) => _$this._signed_by = signed_by;

  CadetDIBuilder();

  CadetDIBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _last_signed = $v.last_signed;
      _signed_by = $v.signed_by;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CadetDI other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CadetDI;
  }

  @override
  void update(void Function(CadetDIBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CadetDI build() => _build();

  _$CadetDI _build() {
    final _$result =
        _$v ?? new _$CadetDI._(last_signed: last_signed, signed_by: signed_by);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
