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
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(Role)),
    ];
    Object? value;
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
        case 'role':
          result.role.replace(serializers.deserialize(value,
              specifiedType: const FullType(Role))! as Role);
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
  final Role role;
  @override
  final DateTime? start;
  @override
  final DateTime? end;

  factory _$TimedRole([void Function(TimedRoleBuilder)? updates]) =>
      (new TimedRoleBuilder()..update(updates))._build();

  _$TimedRole._({required this.role, this.start, this.end}) : super._() {
    BuiltValueNullFieldError.checkNotNull(role, r'TimedRole', 'role');
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
        role == other.role &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimedRole')
          ..add('role', role)
          ..add('start', start)
          ..add('end', end))
        .toString();
  }
}

class TimedRoleBuilder implements Builder<TimedRole, TimedRoleBuilder> {
  _$TimedRole? _$v;

  RoleBuilder? _role;
  RoleBuilder get role => _$this._role ??= new RoleBuilder();
  set role(RoleBuilder? role) => _$this._role = role;

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
      _role = $v.role.toBuilder();
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
    _$TimedRole _$result;
    try {
      _$result =
          _$v ?? new _$TimedRole._(role: role.build(), start: start, end: end);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'role';
        role.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TimedRole', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
