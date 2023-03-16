// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StringRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StringRequest> _$stringRequestSerializer =
    new _$StringRequestSerializer();

class _$StringRequestSerializer implements StructuredSerializer<StringRequest> {
  @override
  final Iterable<Type> types = const [StringRequest, _$StringRequest];
  @override
  final String wireName = 'StringRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, StringRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'string',
      serializers.serialize(object.string,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  StringRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StringRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'string':
          result.string = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StringRequest extends StringRequest {
  @override
  final String string;

  factory _$StringRequest([void Function(StringRequestBuilder)? updates]) =>
      (new StringRequestBuilder()..update(updates))._build();

  _$StringRequest._({required this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(string, r'StringRequest', 'string');
  }

  @override
  StringRequest rebuild(void Function(StringRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StringRequestBuilder toBuilder() => new StringRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StringRequest && string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StringRequest')
          ..add('string', string))
        .toString();
  }
}

class StringRequestBuilder
    implements Builder<StringRequest, StringRequestBuilder> {
  _$StringRequest? _$v;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  StringRequestBuilder();

  StringRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StringRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StringRequest;
  }

  @override
  void update(void Function(StringRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StringRequest build() => _build();

  _$StringRequest _build() {
    final _$result = _$v ??
        new _$StringRequest._(
            string: BuiltValueNullFieldError.checkNotNull(
                string, r'StringRequest', 'string'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
