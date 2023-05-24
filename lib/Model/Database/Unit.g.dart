// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Unit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Unit> _$unitSerializer = new _$UnitSerializer();

class _$UnitSerializer implements StructuredSerializer<Unit> {
  @override
  final Iterable<Type> types = const [Unit, _$Unit];
  @override
  final String wireName = 'Unit';

  @override
  Iterable<Object?> serialize(Serializers serializers, Unit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'pass_status',
      serializers.serialize(object.pass_status,
          specifiedType:
              const FullType(BuiltList, const [const FullType(bool)])),
      'parent_units',
      serializers.serialize(object.parent_units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'sub_units',
      serializers.serialize(object.sub_units,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Unit deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pass_status':
          result.pass_status.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'parent_units':
          result.parent_units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sub_units':
          result.sub_units.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Unit extends Unit {
  @override
  final String? id;
  @override
  final String name;
  @override
  final BuiltList<bool> pass_status;
  @override
  final BuiltList<String> parent_units;
  @override
  final BuiltList<String> sub_units;

  factory _$Unit([void Function(UnitBuilder)? updates]) =>
      (new UnitBuilder()..update(updates))._build();

  _$Unit._(
      {this.id,
      required this.name,
      required this.pass_status,
      required this.parent_units,
      required this.sub_units})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Unit', 'name');
    BuiltValueNullFieldError.checkNotNull(pass_status, r'Unit', 'pass_status');
    BuiltValueNullFieldError.checkNotNull(
        parent_units, r'Unit', 'parent_units');
    BuiltValueNullFieldError.checkNotNull(sub_units, r'Unit', 'sub_units');
  }

  @override
  Unit rebuild(void Function(UnitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitBuilder toBuilder() => new UnitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Unit &&
        id == other.id &&
        name == other.name &&
        pass_status == other.pass_status &&
        parent_units == other.parent_units &&
        sub_units == other.sub_units;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, pass_status.hashCode);
    _$hash = $jc(_$hash, parent_units.hashCode);
    _$hash = $jc(_$hash, sub_units.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Unit')
          ..add('id', id)
          ..add('name', name)
          ..add('pass_status', pass_status)
          ..add('parent_units', parent_units)
          ..add('sub_units', sub_units))
        .toString();
  }
}

class UnitBuilder implements Builder<Unit, UnitBuilder> {
  _$Unit? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<bool>? _pass_status;
  ListBuilder<bool> get pass_status =>
      _$this._pass_status ??= new ListBuilder<bool>();
  set pass_status(ListBuilder<bool>? pass_status) =>
      _$this._pass_status = pass_status;

  ListBuilder<String>? _parent_units;
  ListBuilder<String> get parent_units =>
      _$this._parent_units ??= new ListBuilder<String>();
  set parent_units(ListBuilder<String>? parent_units) =>
      _$this._parent_units = parent_units;

  ListBuilder<String>? _sub_units;
  ListBuilder<String> get sub_units =>
      _$this._sub_units ??= new ListBuilder<String>();
  set sub_units(ListBuilder<String>? sub_units) =>
      _$this._sub_units = sub_units;

  UnitBuilder();

  UnitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _pass_status = $v.pass_status.toBuilder();
      _parent_units = $v.parent_units.toBuilder();
      _sub_units = $v.sub_units.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Unit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Unit;
  }

  @override
  void update(void Function(UnitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Unit build() => _build();

  _$Unit _build() {
    _$Unit _$result;
    try {
      _$result = _$v ??
          new _$Unit._(
              id: id,
              name:
                  BuiltValueNullFieldError.checkNotNull(name, r'Unit', 'name'),
              pass_status: pass_status.build(),
              parent_units: parent_units.build(),
              sub_units: sub_units.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pass_status';
        pass_status.build();
        _$failedField = 'parent_units';
        parent_units.build();
        _$failedField = 'sub_units';
        sub_units.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Unit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
