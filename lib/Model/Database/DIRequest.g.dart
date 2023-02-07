// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DIRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DIRequest> _$dIRequestSerializer = new _$DIRequestSerializer();

class _$DIRequestSerializer implements StructuredSerializer<DIRequest> {
  @override
  final Iterable<Type> types = const [DIRequest, _$DIRequest];
  @override
  final String wireName = 'DIRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, DIRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'cadet_id',
      serializers.serialize(object.cadet_id,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DIRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DIRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cadet_id':
          result.cadet_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DIRequest extends DIRequest {
  @override
  final String cadet_id;

  factory _$DIRequest([void Function(DIRequestBuilder)? updates]) =>
      (new DIRequestBuilder()..update(updates))._build();

  _$DIRequest._({required this.cadet_id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(cadet_id, r'DIRequest', 'cadet_id');
  }

  @override
  DIRequest rebuild(void Function(DIRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DIRequestBuilder toBuilder() => new DIRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DIRequest && cadet_id == other.cadet_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cadet_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DIRequest')
          ..add('cadet_id', cadet_id))
        .toString();
  }
}

class DIRequestBuilder implements Builder<DIRequest, DIRequestBuilder> {
  _$DIRequest? _$v;

  String? _cadet_id;
  String? get cadet_id => _$this._cadet_id;
  set cadet_id(String? cadet_id) => _$this._cadet_id = cadet_id;

  DIRequestBuilder();

  DIRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cadet_id = $v.cadet_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DIRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DIRequest;
  }

  @override
  void update(void Function(DIRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DIRequest build() => _build();

  _$DIRequest _build() {
    final _$result = _$v ??
        new _$DIRequest._(
            cadet_id: BuiltValueNullFieldError.checkNotNull(
                cadet_id, r'DIRequest', 'cadet_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
