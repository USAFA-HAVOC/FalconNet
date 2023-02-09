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
      'signed',
      serializers.serialize(object.signed, specifiedType: const FullType(int)),
      'unsigned',
      serializers.serialize(object.unsigned,
          specifiedType: const FullType(int)),
      'out',
      serializers.serialize(object.out, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitSummary extends UnitSummary {
  @override
  final int signed;
  @override
  final int unsigned;
  @override
  final int out;
  @override
  final int total;
  @override
  final String? group;
  @override
  final String name;

  factory _$UnitSummary([void Function(UnitSummaryBuilder)? updates]) =>
      (new UnitSummaryBuilder()..update(updates))._build();

  _$UnitSummary._(
      {required this.signed,
      required this.unsigned,
      required this.out,
      required this.total,
      this.group,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(signed, r'UnitSummary', 'signed');
    BuiltValueNullFieldError.checkNotNull(unsigned, r'UnitSummary', 'unsigned');
    BuiltValueNullFieldError.checkNotNull(out, r'UnitSummary', 'out');
    BuiltValueNullFieldError.checkNotNull(total, r'UnitSummary', 'total');
    BuiltValueNullFieldError.checkNotNull(name, r'UnitSummary', 'name');
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
        total == other.total &&
        group == other.group &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signed.hashCode);
    _$hash = $jc(_$hash, unsigned.hashCode);
    _$hash = $jc(_$hash, out.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitSummary')
          ..add('signed', signed)
          ..add('unsigned', unsigned)
          ..add('out', out)
          ..add('total', total)
          ..add('group', group)
          ..add('name', name))
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

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  UnitSummaryBuilder();

  UnitSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signed = $v.signed;
      _unsigned = $v.unsigned;
      _out = $v.out;
      _total = $v.total;
      _group = $v.group;
      _name = $v.name;
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
    final _$result = _$v ??
        new _$UnitSummary._(
            signed: BuiltValueNullFieldError.checkNotNull(
                signed, r'UnitSummary', 'signed'),
            unsigned: BuiltValueNullFieldError.checkNotNull(
                unsigned, r'UnitSummary', 'unsigned'),
            out: BuiltValueNullFieldError.checkNotNull(
                out, r'UnitSummary', 'out'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'UnitSummary', 'total'),
            group: group,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UnitSummary', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
