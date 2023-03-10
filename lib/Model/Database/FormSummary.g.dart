// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormSummary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FormSummary> _$formSummarySerializer = new _$FormSummarySerializer();

class _$FormSummarySerializer implements StructuredSerializer<FormSummary> {
  @override
  final Iterable<Type> types = const [FormSummary, _$FormSummary];
  @override
  final String wireName = 'FormSummary';

  @override
  Iterable<Object?> serialize(Serializers serializers, FormSummary object,
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
  FormSummary deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FormSummaryBuilder();

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

class _$FormSummary extends FormSummary {
  @override
  final String title;
  @override
  final String description;
  @override
  final bool signed;

  factory _$FormSummary([void Function(FormSummaryBuilder)? updates]) =>
      (new FormSummaryBuilder()..update(updates))._build();

  _$FormSummary._(
      {required this.title, required this.description, required this.signed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'FormSummary', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'FormSummary', 'description');
    BuiltValueNullFieldError.checkNotNull(signed, r'FormSummary', 'signed');
  }

  @override
  FormSummary rebuild(void Function(FormSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormSummaryBuilder toBuilder() => new FormSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormSummary &&
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
    return (newBuiltValueToStringHelper(r'FormSummary')
          ..add('title', title)
          ..add('description', description)
          ..add('signed', signed))
        .toString();
  }
}

class FormSummaryBuilder implements Builder<FormSummary, FormSummaryBuilder> {
  _$FormSummary? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _signed;
  bool? get signed => _$this._signed;
  set signed(bool? signed) => _$this._signed = signed;

  FormSummaryBuilder();

  FormSummaryBuilder get _$this {
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
  void replace(FormSummary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FormSummary;
  }

  @override
  void update(void Function(FormSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormSummary build() => _build();

  _$FormSummary _build() {
    final _$result = _$v ??
        new _$FormSummary._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'FormSummary', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'FormSummary', 'description'),
            signed: BuiltValueNullFieldError.checkNotNull(
                signed, r'FormSummary', 'signed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
