// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserNotification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserNotification> _$userNotificationSerializer =
    new _$UserNotificationSerializer();

class _$UserNotificationSerializer
    implements StructuredSerializer<UserNotification> {
  @override
  final Iterable<Type> types = const [UserNotification, _$UserNotification];
  @override
  final String wireName = 'UserNotification';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserNotification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'destination',
      serializers.serialize(object.destination,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserNotification deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserNotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserNotification extends UserNotification {
  @override
  final String message;
  @override
  final String destination;

  factory _$UserNotification(
          [void Function(UserNotificationBuilder)? updates]) =>
      (new UserNotificationBuilder()..update(updates))._build();

  _$UserNotification._({required this.message, required this.destination})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'UserNotification', 'message');
    BuiltValueNullFieldError.checkNotNull(
        destination, r'UserNotification', 'destination');
  }

  @override
  UserNotification rebuild(void Function(UserNotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserNotificationBuilder toBuilder() =>
      new UserNotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserNotification &&
        message == other.message &&
        destination == other.destination;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, destination.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserNotification')
          ..add('message', message)
          ..add('destination', destination))
        .toString();
  }
}

class UserNotificationBuilder
    implements Builder<UserNotification, UserNotificationBuilder> {
  _$UserNotification? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _destination;
  String? get destination => _$this._destination;
  set destination(String? destination) => _$this._destination = destination;

  UserNotificationBuilder();

  UserNotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _destination = $v.destination;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserNotification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserNotification;
  }

  @override
  void update(void Function(UserNotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserNotification build() => _build();

  _$UserNotification _build() {
    final _$result = _$v ??
        new _$UserNotification._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'UserNotification', 'message'),
            destination: BuiltValueNullFieldError.checkNotNull(
                destination, r'UserNotification', 'destination'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
