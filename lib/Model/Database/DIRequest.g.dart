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
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'signed',
      serializers.serialize(object.signed, specifiedType: const FullType(bool)),
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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signed':
          result.signed = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$DIRequest extends DIRequest {
  @override
  final String title;
  @override
  final String description;
  @override
  final bool signed;

  factory _$DIRequest([void Function(DIRequestBuilder)? updates]) =>
      (new DIRequestBuilder()..update(updates))._build();

  _$DIRequest._(
      {required this.title, required this.description, required this.signed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'DIRequest', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'DIRequest', 'description');
    BuiltValueNullFieldError.checkNotNull(signed, r'DIRequest', 'signed');
  }

  @override
  DIRequest rebuild(void Function(DIRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DIRequestBuilder toBuilder() => new DIRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DIRequest &&
        title == other.title &&
        description == other.description &&
        signed == other.signed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, signed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DIRequest')
          ..add('title', title)
          ..add('description', description)
          ..add('signed', signed))
        .toString();
  }
}

class DIRequestBuilder implements Builder<DIRequest, DIRequestBuilder> {
  _$DIRequest? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _signed;
  bool? get signed => _$this._signed;
  set signed(bool? signed) => _$this._signed = signed;

  DIRequestBuilder();

  DIRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _signed = $v.signed;
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
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'DIRequest', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'DIRequest', 'description'),
            signed: BuiltValueNullFieldError.checkNotNull(
                signed, r'DIRequest', 'signed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
