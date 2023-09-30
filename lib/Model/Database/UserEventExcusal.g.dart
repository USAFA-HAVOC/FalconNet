// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEventExcusal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserEventExcusal> _$userEventExcusalSerializer =
    new _$UserEventExcusalSerializer();

class _$UserEventExcusalSerializer
    implements StructuredSerializer<UserEventExcusal> {
  @override
  final Iterable<Type> types = const [UserEventExcusal, _$UserEventExcusal];
  @override
  final String wireName = 'UserEventExcusal';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserEventExcusal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.other_description;
    if (value != null) {
      result
        ..add('other_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserEventExcusal deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserEventExcusalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'other_description':
          result.other_description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserEventExcusal extends UserEventExcusal {
  @override
  final String type;
  @override
  final String? number;
  @override
  final String? other_description;

  factory _$UserEventExcusal(
          [void Function(UserEventExcusalBuilder)? updates]) =>
      (new UserEventExcusalBuilder()..update(updates))._build();

  _$UserEventExcusal._(
      {required this.type, this.number, this.other_description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'UserEventExcusal', 'type');
  }

  @override
  UserEventExcusal rebuild(void Function(UserEventExcusalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEventExcusalBuilder toBuilder() =>
      new UserEventExcusalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEventExcusal &&
        type == other.type &&
        number == other.number &&
        other_description == other.other_description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, other_description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserEventExcusal')
          ..add('type', type)
          ..add('number', number)
          ..add('other_description', other_description))
        .toString();
  }
}

class UserEventExcusalBuilder
    implements Builder<UserEventExcusal, UserEventExcusalBuilder> {
  _$UserEventExcusal? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  String? _other_description;
  String? get other_description => _$this._other_description;
  set other_description(String? other_description) =>
      _$this._other_description = other_description;

  UserEventExcusalBuilder();

  UserEventExcusalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _number = $v.number;
      _other_description = $v.other_description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserEventExcusal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserEventExcusal;
  }

  @override
  void update(void Function(UserEventExcusalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserEventExcusal build() => _build();

  _$UserEventExcusal _build() {
    final _$result = _$v ??
        new _$UserEventExcusal._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'UserEventExcusal', 'type'),
            number: number,
            other_description: other_description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
