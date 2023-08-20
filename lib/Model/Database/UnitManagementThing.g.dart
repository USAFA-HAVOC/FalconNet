// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitManagementThing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitManagementThing> _$unitManagementThingSerializer =
    new _$UnitManagementThingSerializer();

class _$UnitManagementThingSerializer
    implements StructuredSerializer<UnitManagementThing> {
  @override
  final Iterable<Type> types = const [
    UnitManagementThing,
    _$UnitManagementThing
  ];
  @override
  final String wireName = 'UnitManagementThing';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UnitManagementThing object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'members',
      serializers.serialize(object.members,
          specifiedType: const FullType(
              BuiltList, const [const FullType(IndividualPassStatus)])),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(Unit)),
    ];

    return result;
  }

  @override
  UnitManagementThing deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitManagementThingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'members':
          result.members.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(IndividualPassStatus)]))!
              as BuiltList<Object?>);
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

class _$UnitManagementThing extends UnitManagementThing {
  @override
  final BuiltList<IndividualPassStatus> members;
  @override
  final Unit unit;

  factory _$UnitManagementThing(
          [void Function(UnitManagementThingBuilder)? updates]) =>
      (new UnitManagementThingBuilder()..update(updates))._build();

  _$UnitManagementThing._({required this.members, required this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        members, r'UnitManagementThing', 'members');
    BuiltValueNullFieldError.checkNotNull(unit, r'UnitManagementThing', 'unit');
  }

  @override
  UnitManagementThing rebuild(
          void Function(UnitManagementThingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitManagementThingBuilder toBuilder() =>
      new UnitManagementThingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitManagementThing &&
        members == other.members &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitManagementThing')
          ..add('members', members)
          ..add('unit', unit))
        .toString();
  }
}

class UnitManagementThingBuilder
    implements Builder<UnitManagementThing, UnitManagementThingBuilder> {
  _$UnitManagementThing? _$v;

  ListBuilder<IndividualPassStatus>? _members;
  ListBuilder<IndividualPassStatus> get members =>
      _$this._members ??= new ListBuilder<IndividualPassStatus>();
  set members(ListBuilder<IndividualPassStatus>? members) =>
      _$this._members = members;

  UnitBuilder? _unit;
  UnitBuilder get unit => _$this._unit ??= new UnitBuilder();
  set unit(UnitBuilder? unit) => _$this._unit = unit;

  UnitManagementThingBuilder();

  UnitManagementThingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _members = $v.members.toBuilder();
      _unit = $v.unit.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitManagementThing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitManagementThing;
  }

  @override
  void update(void Function(UnitManagementThingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitManagementThing build() => _build();

  _$UnitManagementThing _build() {
    _$UnitManagementThing _$result;
    try {
      _$result = _$v ??
          new _$UnitManagementThing._(
              members: members.build(), unit: unit.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        members.build();
        _$failedField = 'unit';
        unit.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UnitManagementThing', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
