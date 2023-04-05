// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PassStatusRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PassStatusRequest> _$passStatusRequestSerializer =
    new _$PassStatusRequestSerializer();

class _$PassStatusRequestSerializer
    implements StructuredSerializer<PassStatusRequest> {
  @override
  final Iterable<Type> types = const [PassStatusRequest, _$PassStatusRequest];
  @override
  final String wireName = 'PassStatusRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, PassStatusRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType:
              const FullType(BuiltList, const [const FullType(bool)])),
    ];

    return result;
  }

  @override
  PassStatusRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PassStatusRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PassStatusRequest extends PassStatusRequest {
  @override
  final BuiltList<bool> status;

  factory _$PassStatusRequest(
          [void Function(PassStatusRequestBuilder)? updates]) =>
      (new PassStatusRequestBuilder()..update(updates))._build();

  _$PassStatusRequest._({required this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        status, r'PassStatusRequest', 'status');
  }

  @override
  PassStatusRequest rebuild(void Function(PassStatusRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PassStatusRequestBuilder toBuilder() =>
      new PassStatusRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassStatusRequest && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassStatusRequest')
          ..add('status', status))
        .toString();
  }
}

class PassStatusRequestBuilder
    implements Builder<PassStatusRequest, PassStatusRequestBuilder> {
  _$PassStatusRequest? _$v;

  ListBuilder<bool>? _status;
  ListBuilder<bool> get status => _$this._status ??= new ListBuilder<bool>();
  set status(ListBuilder<bool>? status) => _$this._status = status;

  PassStatusRequestBuilder();

  PassStatusRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PassStatusRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PassStatusRequest;
  }

  @override
  void update(void Function(PassStatusRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PassStatusRequest build() => _build();

  _$PassStatusRequest _build() {
    _$PassStatusRequest _$result;
    try {
      _$result = _$v ?? new _$PassStatusRequest._(status: status.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'status';
        status.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PassStatusRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
