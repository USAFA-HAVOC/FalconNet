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
      'is_squadron',
      serializers.serialize(object.is_squadron,
          specifiedType: const FullType(bool)),
      'pass_status',
      serializers.serialize(object.pass_status,
          specifiedType:
              const FullType(BuiltList, const [const FullType(bool)])),
    ];
    Object? value;
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_squadron':
          result.is_squadron = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'pass_status':
          result.pass_status.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Unit extends Unit {
  @override
  final String name;
  @override
  final String? group;
  @override
  final bool is_squadron;
  @override
  final BuiltList<bool> pass_status;
  @override
  final String? id;

  factory _$Unit([void Function(UnitBuilder)? updates]) =>
      (new UnitBuilder()..update(updates))._build();

  _$Unit._(
      {required this.name,
      this.group,
      required this.is_squadron,
      required this.pass_status,
      this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Unit', 'name');
    BuiltValueNullFieldError.checkNotNull(is_squadron, r'Unit', 'is_squadron');
    BuiltValueNullFieldError.checkNotNull(pass_status, r'Unit', 'pass_status');
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
        name == other.name &&
        group == other.group &&
        is_squadron == other.is_squadron &&
        pass_status == other.pass_status &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, is_squadron.hashCode);
    _$hash = $jc(_$hash, pass_status.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Unit')
          ..add('name', name)
          ..add('group', group)
          ..add('is_squadron', is_squadron)
          ..add('pass_status', pass_status)
          ..add('id', id))
        .toString();
  }
}

class UnitBuilder implements Builder<Unit, UnitBuilder> {
  _$Unit? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  bool? _is_squadron;
  bool? get is_squadron => _$this._is_squadron;
  set is_squadron(bool? is_squadron) => _$this._is_squadron = is_squadron;

  ListBuilder<bool>? _pass_status;
  ListBuilder<bool> get pass_status =>
      _$this._pass_status ??= new ListBuilder<bool>();
  set pass_status(ListBuilder<bool>? pass_status) =>
      _$this._pass_status = pass_status;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  UnitBuilder();

  UnitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _group = $v.group;
      _is_squadron = $v.is_squadron;
      _pass_status = $v.pass_status.toBuilder();
      _id = $v.id;
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
              name:
                  BuiltValueNullFieldError.checkNotNull(name, r'Unit', 'name'),
              group: group,
              is_squadron: BuiltValueNullFieldError.checkNotNull(
                  is_squadron, r'Unit', 'is_squadron'),
              pass_status: pass_status.build(),
              id: id);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pass_status';
        pass_status.build();
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
