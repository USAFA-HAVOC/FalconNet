// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StanEvalUser.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StanEvalUser> _$stanEvalUserSerializer =
    new _$StanEvalUserSerializer();

class _$StanEvalUserSerializer implements StructuredSerializer<StanEvalUser> {
  @override
  final Iterable<Type> types = const [StanEvalUser, _$StanEvalUser];
  @override
  final String wireName = 'StanEvalUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, StanEvalUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.room;
    if (value != null) {
      result
        ..add('room')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  StanEvalUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StanEvalUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'room':
          result.room = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$StanEvalUser extends StanEvalUser {
  @override
  final String user_id;
  @override
  final String name;
  @override
  final String? room;

  factory _$StanEvalUser([void Function(StanEvalUserBuilder)? updates]) =>
      (new StanEvalUserBuilder()..update(updates))._build();

  _$StanEvalUser._({required this.user_id, required this.name, this.room})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user_id, r'StanEvalUser', 'user_id');
    BuiltValueNullFieldError.checkNotNull(name, r'StanEvalUser', 'name');
  }

  @override
  StanEvalUser rebuild(void Function(StanEvalUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StanEvalUserBuilder toBuilder() => new StanEvalUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StanEvalUser &&
        user_id == other.user_id &&
        name == other.name &&
        room == other.room;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, room.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StanEvalUser')
          ..add('user_id', user_id)
          ..add('name', name)
          ..add('room', room))
        .toString();
  }
}

class StanEvalUserBuilder
    implements Builder<StanEvalUser, StanEvalUserBuilder> {
  _$StanEvalUser? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _room;
  String? get room => _$this._room;
  set room(String? room) => _$this._room = room;

  StanEvalUserBuilder();

  StanEvalUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _name = $v.name;
      _room = $v.room;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StanEvalUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StanEvalUser;
  }

  @override
  void update(void Function(StanEvalUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StanEvalUser build() => _build();

  _$StanEvalUser _build() {
    final _$result = _$v ??
        new _$StanEvalUser._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'StanEvalUser', 'user_id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'StanEvalUser', 'name'),
            room: room);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
