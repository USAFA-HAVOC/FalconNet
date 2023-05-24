// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimedRole.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TimedRole> _$timedRoleSerializer = new _$TimedRoleSerializer();

class _$TimedRoleSerializer implements StructuredSerializer<TimedRole> {
  @override
  final Iterable<Type> types = const [TimedRole, _$TimedRole];
  @override
  final String wireName = 'TimedRole';

  @override
  Iterable<Object?> serialize(Serializers serializers, TimedRole object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.unit;
    if (value != null) {
      result
        ..add('unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.start;
    if (value != null) {
      result
        ..add('start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.end;
    if (value != null) {
      result
        ..add('end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  TimedRole deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TimedRoleBuilder();

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
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start':
          result.start = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$TimedRole extends TimedRole {
  @override
  final String name;
  @override
  final String? unit;
  @override
  final DateTime? start;
  @override
  final DateTime? end;

  factory _$TimedRole([void Function(TimedRoleBuilder)? updates]) =>
      (new TimedRoleBuilder()..update(updates))._build();

  _$TimedRole._({required this.name, this.unit, this.start, this.end})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'TimedRole', 'name');
  }

  @override
  TimedRole rebuild(void Function(TimedRoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimedRoleBuilder toBuilder() => new TimedRoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimedRole &&
        name == other.name &&
        unit == other.unit &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimedRole')
          ..add('name', name)
          ..add('unit', unit)
          ..add('start', start)
          ..add('end', end))
        .toString();
  }
}

class TimedRoleBuilder implements Builder<TimedRole, TimedRoleBuilder> {
  _$TimedRole? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  DateTime? _start;
  DateTime? get start => _$this._start;
  set start(DateTime? start) => _$this._start = start;

  DateTime? _end;
  DateTime? get end => _$this._end;
  set end(DateTime? end) => _$this._end = end;

  TimedRoleBuilder();

  TimedRoleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _unit = $v.unit;
      _start = $v.start;
      _end = $v.end;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimedRole other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TimedRole;
  }

  @override
  void update(void Function(TimedRoleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TimedRole build() => _build();

  _$TimedRole _build() {
    final _$result = _$v ??
        new _$TimedRole._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TimedRole', 'name'),
            unit: unit,
            start: start,
            end: end);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
