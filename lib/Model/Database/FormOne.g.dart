// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormOne.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FormOne> _$formOneSerializer = new _$FormOneSerializer();

class _$FormOneSerializer implements StructuredSerializer<FormOne> {
  @override
  final Iterable<Type> types = const [FormOne, _$FormOne];
  @override
  final String wireName = 'FormOne';

  @override
  Iterable<Object?> serialize(Serializers serializers, FormOne object,
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
  FormOne deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FormOneBuilder();

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

class _$FormOne extends FormOne {
  @override
  final String title;
  @override
  final String description;
  @override
  final bool signed;

  factory _$FormOne([void Function(FormOneBuilder)? updates]) =>
      (new FormOneBuilder()..update(updates))._build();

  _$FormOne._(
      {required this.title, required this.description, required this.signed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'FormOne', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'FormOne', 'description');
    BuiltValueNullFieldError.checkNotNull(signed, r'FormOne', 'signed');
  }

  @override
  FormOne rebuild(void Function(FormOneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormOneBuilder toBuilder() => new FormOneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormOne &&
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
    return (newBuiltValueToStringHelper(r'FormOne')
          ..add('title', title)
          ..add('description', description)
          ..add('signed', signed))
        .toString();
  }
}

class FormOneBuilder implements Builder<FormOne, FormOneBuilder> {
  _$FormOne? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _signed;
  bool? get signed => _$this._signed;
  set signed(bool? signed) => _$this._signed = signed;

  FormOneBuilder();

  FormOneBuilder get _$this {
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
  void replace(FormOne other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FormOne;
  }

  @override
  void update(void Function(FormOneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormOne build() => _build();

  _$FormOne _build() {
    final _$result = _$v ??
        new _$FormOne._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'FormOne', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'FormOne', 'description'),
            signed: BuiltValueNullFieldError.checkNotNull(
                signed, r'FormOne', 'signed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
