// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignRequest> _$signRequestSerializer = new _$SignRequestSerializer();

class _$SignRequestSerializer implements StructuredSerializer<SignRequest> {
  @override
  final Iterable<Type> types = const [SignRequest, _$SignRequest];
  @override
  final String wireName = 'SignRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, SignRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.event_id;
    if (value != null) {
      result
        ..add('event_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user_id;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SignRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event_id':
          result.event_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SignRequest extends SignRequest {
  @override
  final String? event_id;
  @override
  final String? user_id;

  factory _$SignRequest([void Function(SignRequestBuilder)? updates]) =>
      (new SignRequestBuilder()..update(updates))._build();

  _$SignRequest._({this.event_id, this.user_id}) : super._();

  @override
  SignRequest rebuild(void Function(SignRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignRequestBuilder toBuilder() => new SignRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignRequest &&
        event_id == other.event_id &&
        user_id == other.user_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event_id.hashCode);
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignRequest')
          ..add('event_id', event_id)
          ..add('user_id', user_id))
        .toString();
  }
}

class SignRequestBuilder implements Builder<SignRequest, SignRequestBuilder> {
  _$SignRequest? _$v;

  String? _event_id;
  String? get event_id => _$this._event_id;
  set event_id(String? event_id) => _$this._event_id = event_id;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  SignRequestBuilder();

  SignRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event_id = $v.event_id;
      _user_id = $v.user_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignRequest;
  }

  @override
  void update(void Function(SignRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignRequest build() => _build();

  _$SignRequest _build() {
    final _$result =
        _$v ?? new _$SignRequest._(event_id: event_id, user_id: user_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
