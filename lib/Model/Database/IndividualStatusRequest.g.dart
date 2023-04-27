// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IndividualStatusRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IndividualStatusRequest> _$individualStatusRequestSerializer =
    new _$IndividualStatusRequestSerializer();

class _$IndividualStatusRequestSerializer
    implements StructuredSerializer<IndividualStatusRequest> {
  @override
  final Iterable<Type> types = const [
    IndividualStatusRequest,
    _$IndividualStatusRequest
  ];
  @override
  final String wireName = 'IndividualStatusRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, IndividualStatusRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  IndividualStatusRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IndividualStatusRequestBuilder();

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$IndividualStatusRequest extends IndividualStatusRequest {
  @override
  final String user_id;
  @override
  final bool status;

  factory _$IndividualStatusRequest(
          [void Function(IndividualStatusRequestBuilder)? updates]) =>
      (new IndividualStatusRequestBuilder()..update(updates))._build();

  _$IndividualStatusRequest._({required this.user_id, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'IndividualStatusRequest', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        status, r'IndividualStatusRequest', 'status');
  }

  @override
  IndividualStatusRequest rebuild(
          void Function(IndividualStatusRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndividualStatusRequestBuilder toBuilder() =>
      new IndividualStatusRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndividualStatusRequest &&
        user_id == other.user_id &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndividualStatusRequest')
          ..add('user_id', user_id)
          ..add('status', status))
        .toString();
  }
}

class IndividualStatusRequestBuilder
    implements
        Builder<IndividualStatusRequest, IndividualStatusRequestBuilder> {
  _$IndividualStatusRequest? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  IndividualStatusRequestBuilder();

  IndividualStatusRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndividualStatusRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndividualStatusRequest;
  }

  @override
  void update(void Function(IndividualStatusRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndividualStatusRequest build() => _build();

  _$IndividualStatusRequest _build() {
    final _$result = _$v ??
        new _$IndividualStatusRequest._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'IndividualStatusRequest', 'user_id'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'IndividualStatusRequest', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
