// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEventStatus.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserEventStatus> _$userEventStatusSerializer =
    new _$UserEventStatusSerializer();

class _$UserEventStatusSerializer
    implements StructuredSerializer<UserEventStatus> {
  @override
  final Iterable<Type> types = const [UserEventStatus, _$UserEventStatus];
  @override
  final String wireName = 'UserEventStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserEventStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.returning;
    if (value != null) {
      result
        ..add('returning')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.signature_user_id;
    if (value != null) {
      result
        ..add('signature_user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signature_name;
    if (value != null) {
      result
        ..add('signature_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signature_time;
    if (value != null) {
      result
        ..add('signature_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.excusal;
    if (value != null) {
      result
        ..add('excusal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Excusal)));
    }
    return result;
  }

  @override
  UserEventStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserEventStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'returning':
          result.returning = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'signature_user_id':
          result.signature_user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'signature_name':
          result.signature_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'signature_time':
          result.signature_time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'excusal':
          result.excusal.replace(serializers.deserialize(value,
              specifiedType: const FullType(Excusal))! as Excusal);
          break;
      }
    }

    return result.build();
  }
}

class _$UserEventStatus extends UserEventStatus {
  @override
  final String status;
  @override
  final DateTime? returning;
  @override
  final String? signature_user_id;
  @override
  final String? signature_name;
  @override
  final DateTime? signature_time;
  @override
  final Excusal? excusal;

  factory _$UserEventStatus([void Function(UserEventStatusBuilder)? updates]) =>
      (new UserEventStatusBuilder()..update(updates))._build();

  _$UserEventStatus._(
      {required this.status,
      this.returning,
      this.signature_user_id,
      this.signature_name,
      this.signature_time,
      this.excusal})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'UserEventStatus', 'status');
  }

  @override
  UserEventStatus rebuild(void Function(UserEventStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEventStatusBuilder toBuilder() =>
      new UserEventStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEventStatus &&
        status == other.status &&
        returning == other.returning &&
        signature_user_id == other.signature_user_id &&
        signature_name == other.signature_name &&
        signature_time == other.signature_time &&
        excusal == other.excusal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, returning.hashCode);
    _$hash = $jc(_$hash, signature_user_id.hashCode);
    _$hash = $jc(_$hash, signature_name.hashCode);
    _$hash = $jc(_$hash, signature_time.hashCode);
    _$hash = $jc(_$hash, excusal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserEventStatus')
          ..add('status', status)
          ..add('returning', returning)
          ..add('signature_user_id', signature_user_id)
          ..add('signature_name', signature_name)
          ..add('signature_time', signature_time)
          ..add('excusal', excusal))
        .toString();
  }
}

class UserEventStatusBuilder
    implements Builder<UserEventStatus, UserEventStatusBuilder> {
  _$UserEventStatus? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _returning;
  DateTime? get returning => _$this._returning;
  set returning(DateTime? returning) => _$this._returning = returning;

  String? _signature_user_id;
  String? get signature_user_id => _$this._signature_user_id;
  set signature_user_id(String? signature_user_id) =>
      _$this._signature_user_id = signature_user_id;

  String? _signature_name;
  String? get signature_name => _$this._signature_name;
  set signature_name(String? signature_name) =>
      _$this._signature_name = signature_name;

  DateTime? _signature_time;
  DateTime? get signature_time => _$this._signature_time;
  set signature_time(DateTime? signature_time) =>
      _$this._signature_time = signature_time;

  ExcusalBuilder? _excusal;
  ExcusalBuilder get excusal => _$this._excusal ??= new ExcusalBuilder();
  set excusal(ExcusalBuilder? excusal) => _$this._excusal = excusal;

  UserEventStatusBuilder();

  UserEventStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _returning = $v.returning;
      _signature_user_id = $v.signature_user_id;
      _signature_name = $v.signature_name;
      _signature_time = $v.signature_time;
      _excusal = $v.excusal?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserEventStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserEventStatus;
  }

  @override
  void update(void Function(UserEventStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserEventStatus build() => _build();

  _$UserEventStatus _build() {
    _$UserEventStatus _$result;
    try {
      _$result = _$v ??
          new _$UserEventStatus._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'UserEventStatus', 'status'),
              returning: returning,
              signature_user_id: signature_user_id,
              signature_name: signature_name,
              signature_time: signature_time,
              excusal: _excusal?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'excusal';
        _excusal?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserEventStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
