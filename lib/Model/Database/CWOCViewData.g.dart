// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CWOCViewData.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CWOCViewData> _$cWOCViewDataSerializer =
    new _$CWOCViewDataSerializer();

class _$CWOCViewDataSerializer implements StructuredSerializer<CWOCViewData> {
  @override
  final Iterable<Type> types = const [CWOCViewData, _$CWOCViewData];
  @override
  final String wireName = 'CWOCViewData';

  @override
  Iterable<Object?> serialize(Serializers serializers, CWOCViewData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(String)),
      'squadron',
      serializers.serialize(object.squadron,
          specifiedType: const FullType(int)),
      'group',
      serializers.serialize(object.group,
          specifiedType: const FullType(String)),
      'unit_accountability_percent',
      serializers.serialize(object.unit_accountability_percent,
          specifiedType: const FullType(double)),
      'squadron_accountability_percent',
      serializers.serialize(object.squadron_accountability_percent,
          specifiedType: const FullType(double)),
      'group_accountability_percent',
      serializers.serialize(object.group_accountability_percent,
          specifiedType: const FullType(double)),
      'wing_accountability_percent',
      serializers.serialize(object.wing_accountability_percent,
          specifiedType: const FullType(double)),
      'squadron_members',
      serializers.serialize(object.squadron_members,
          specifiedType: const FullType(int)),
      'group_members',
      serializers.serialize(object.group_members,
          specifiedType: const FullType(int)),
      'wing_members',
      serializers.serialize(object.wing_members,
          specifiedType: const FullType(int)),
      'unit_members',
      serializers.serialize(object.unit_members,
          specifiedType:
              const FullType(BuiltList, const [const FullType(User)])),
    ];

    return result;
  }

  @override
  CWOCViewData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CWOCViewDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'squadron':
          result.squadron = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'unit_accountability_percent':
          result.unit_accountability_percent = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'squadron_accountability_percent':
          result.squadron_accountability_percent = serializers.deserialize(
              value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'group_accountability_percent':
          result.group_accountability_percent = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'wing_accountability_percent':
          result.wing_accountability_percent = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'squadron_members':
          result.squadron_members = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group_members':
          result.group_members = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'wing_members':
          result.wing_members = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unit_members':
          result.unit_members.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(User)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CWOCViewData extends CWOCViewData {
  @override
  final String unit;
  @override
  final int squadron;
  @override
  final String group;
  @override
  final double unit_accountability_percent;
  @override
  final double squadron_accountability_percent;
  @override
  final double group_accountability_percent;
  @override
  final double wing_accountability_percent;
  @override
  final int squadron_members;
  @override
  final int group_members;
  @override
  final int wing_members;
  @override
  final BuiltList<User> unit_members;

  factory _$CWOCViewData([void Function(CWOCViewDataBuilder)? updates]) =>
      (new CWOCViewDataBuilder()..update(updates))._build();

  _$CWOCViewData._(
      {required this.unit,
      required this.squadron,
      required this.group,
      required this.unit_accountability_percent,
      required this.squadron_accountability_percent,
      required this.group_accountability_percent,
      required this.wing_accountability_percent,
      required this.squadron_members,
      required this.group_members,
      required this.wing_members,
      required this.unit_members})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(unit, r'CWOCViewData', 'unit');
    BuiltValueNullFieldError.checkNotNull(
        squadron, r'CWOCViewData', 'squadron');
    BuiltValueNullFieldError.checkNotNull(group, r'CWOCViewData', 'group');
    BuiltValueNullFieldError.checkNotNull(unit_accountability_percent,
        r'CWOCViewData', 'unit_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(squadron_accountability_percent,
        r'CWOCViewData', 'squadron_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(group_accountability_percent,
        r'CWOCViewData', 'group_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(wing_accountability_percent,
        r'CWOCViewData', 'wing_accountability_percent');
    BuiltValueNullFieldError.checkNotNull(
        squadron_members, r'CWOCViewData', 'squadron_members');
    BuiltValueNullFieldError.checkNotNull(
        group_members, r'CWOCViewData', 'group_members');
    BuiltValueNullFieldError.checkNotNull(
        wing_members, r'CWOCViewData', 'wing_members');
    BuiltValueNullFieldError.checkNotNull(
        unit_members, r'CWOCViewData', 'unit_members');
  }

  @override
  CWOCViewData rebuild(void Function(CWOCViewDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CWOCViewDataBuilder toBuilder() => new CWOCViewDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CWOCViewData &&
        unit == other.unit &&
        squadron == other.squadron &&
        group == other.group &&
        unit_accountability_percent == other.unit_accountability_percent &&
        squadron_accountability_percent ==
            other.squadron_accountability_percent &&
        group_accountability_percent == other.group_accountability_percent &&
        wing_accountability_percent == other.wing_accountability_percent &&
        squadron_members == other.squadron_members &&
        group_members == other.group_members &&
        wing_members == other.wing_members &&
        unit_members == other.unit_members;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, squadron.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, unit_accountability_percent.hashCode);
    _$hash = $jc(_$hash, squadron_accountability_percent.hashCode);
    _$hash = $jc(_$hash, group_accountability_percent.hashCode);
    _$hash = $jc(_$hash, wing_accountability_percent.hashCode);
    _$hash = $jc(_$hash, squadron_members.hashCode);
    _$hash = $jc(_$hash, group_members.hashCode);
    _$hash = $jc(_$hash, wing_members.hashCode);
    _$hash = $jc(_$hash, unit_members.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CWOCViewData')
          ..add('unit', unit)
          ..add('squadron', squadron)
          ..add('group', group)
          ..add('unit_accountability_percent', unit_accountability_percent)
          ..add('squadron_accountability_percent',
              squadron_accountability_percent)
          ..add('group_accountability_percent', group_accountability_percent)
          ..add('wing_accountability_percent', wing_accountability_percent)
          ..add('squadron_members', squadron_members)
          ..add('group_members', group_members)
          ..add('wing_members', wing_members)
          ..add('unit_members', unit_members))
        .toString();
  }
}

class CWOCViewDataBuilder
    implements Builder<CWOCViewData, CWOCViewDataBuilder> {
  _$CWOCViewData? _$v;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  int? _squadron;
  int? get squadron => _$this._squadron;
  set squadron(int? squadron) => _$this._squadron = squadron;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  double? _unit_accountability_percent;
  double? get unit_accountability_percent =>
      _$this._unit_accountability_percent;
  set unit_accountability_percent(double? unit_accountability_percent) =>
      _$this._unit_accountability_percent = unit_accountability_percent;

  double? _squadron_accountability_percent;
  double? get squadron_accountability_percent =>
      _$this._squadron_accountability_percent;
  set squadron_accountability_percent(
          double? squadron_accountability_percent) =>
      _$this._squadron_accountability_percent = squadron_accountability_percent;

  double? _group_accountability_percent;
  double? get group_accountability_percent =>
      _$this._group_accountability_percent;
  set group_accountability_percent(double? group_accountability_percent) =>
      _$this._group_accountability_percent = group_accountability_percent;

  double? _wing_accountability_percent;
  double? get wing_accountability_percent =>
      _$this._wing_accountability_percent;
  set wing_accountability_percent(double? wing_accountability_percent) =>
      _$this._wing_accountability_percent = wing_accountability_percent;

  int? _squadron_members;
  int? get squadron_members => _$this._squadron_members;
  set squadron_members(int? squadron_members) =>
      _$this._squadron_members = squadron_members;

  int? _group_members;
  int? get group_members => _$this._group_members;
  set group_members(int? group_members) =>
      _$this._group_members = group_members;

  int? _wing_members;
  int? get wing_members => _$this._wing_members;
  set wing_members(int? wing_members) => _$this._wing_members = wing_members;

  ListBuilder<User>? _unit_members;
  ListBuilder<User> get unit_members =>
      _$this._unit_members ??= new ListBuilder<User>();
  set unit_members(ListBuilder<User>? unit_members) =>
      _$this._unit_members = unit_members;

  CWOCViewDataBuilder();

  CWOCViewDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unit = $v.unit;
      _squadron = $v.squadron;
      _group = $v.group;
      _unit_accountability_percent = $v.unit_accountability_percent;
      _squadron_accountability_percent = $v.squadron_accountability_percent;
      _group_accountability_percent = $v.group_accountability_percent;
      _wing_accountability_percent = $v.wing_accountability_percent;
      _squadron_members = $v.squadron_members;
      _group_members = $v.group_members;
      _wing_members = $v.wing_members;
      _unit_members = $v.unit_members.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CWOCViewData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CWOCViewData;
  }

  @override
  void update(void Function(CWOCViewDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CWOCViewData build() => _build();

  _$CWOCViewData _build() {
    _$CWOCViewData _$result;
    try {
      _$result = _$v ??
          new _$CWOCViewData._(
              unit: BuiltValueNullFieldError.checkNotNull(
                  unit, r'CWOCViewData', 'unit'),
              squadron: BuiltValueNullFieldError.checkNotNull(
                  squadron, r'CWOCViewData', 'squadron'),
              group: BuiltValueNullFieldError.checkNotNull(
                  group, r'CWOCViewData', 'group'),
              unit_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  unit_accountability_percent, r'CWOCViewData', 'unit_accountability_percent'),
              squadron_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  squadron_accountability_percent, r'CWOCViewData', 'squadron_accountability_percent'),
              group_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  group_accountability_percent, r'CWOCViewData', 'group_accountability_percent'),
              wing_accountability_percent: BuiltValueNullFieldError.checkNotNull(
                  wing_accountability_percent, r'CWOCViewData', 'wing_accountability_percent'),
              squadron_members: BuiltValueNullFieldError.checkNotNull(
                  squadron_members, r'CWOCViewData', 'squadron_members'),
              group_members: BuiltValueNullFieldError.checkNotNull(group_members, r'CWOCViewData', 'group_members'),
              wing_members: BuiltValueNullFieldError.checkNotNull(wing_members, r'CWOCViewData', 'wing_members'),
              unit_members: unit_members.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unit_members';
        unit_members.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CWOCViewData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
