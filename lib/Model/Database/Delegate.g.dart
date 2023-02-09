// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Delegate.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Delegate> _$delegateSerializer = new _$DelegateSerializer();

class _$DelegateSerializer implements StructuredSerializer<Delegate> {
  @override
  final Iterable<Type> types = const [Delegate, _$Delegate];
  @override
  final String wireName = 'Delegate';

  @override
  Iterable<Object?> serialize(Serializers serializers, Delegate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'roles',
      serializers.serialize(object.roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TimedRole)])),
    ];

    return result;
  }

  @override
  Delegate deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DelegateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'roles':
          result.roles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TimedRole)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Delegate extends Delegate {
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<TimedRole> roles;

  factory _$Delegate([void Function(DelegateBuilder)? updates]) =>
      (new DelegateBuilder()..update(updates))._build();

  _$Delegate._({required this.id, required this.name, required this.roles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Delegate', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Delegate', 'name');
    BuiltValueNullFieldError.checkNotNull(roles, r'Delegate', 'roles');
  }

  @override
  Delegate rebuild(void Function(DelegateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DelegateBuilder toBuilder() => new DelegateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Delegate &&
        id == other.id &&
        name == other.name &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Delegate')
          ..add('id', id)
          ..add('name', name)
          ..add('roles', roles))
        .toString();
  }
}

class DelegateBuilder implements Builder<Delegate, DelegateBuilder> {
  _$Delegate? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<TimedRole>? _roles;
  ListBuilder<TimedRole> get roles =>
      _$this._roles ??= new ListBuilder<TimedRole>();
  set roles(ListBuilder<TimedRole>? roles) => _$this._roles = roles;

  DelegateBuilder();

  DelegateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _roles = $v.roles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Delegate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Delegate;
  }

  @override
  void update(void Function(DelegateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Delegate build() => _build();

  _$Delegate _build() {
    _$Delegate _$result;
    try {
      _$result = _$v ??
          new _$Delegate._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Delegate', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Delegate', 'name'),
              roles: roles.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Delegate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
