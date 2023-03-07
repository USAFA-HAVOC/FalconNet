// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormData.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FormData> _$formDataSerializer = new _$FormDataSerializer();

class _$FormDataSerializer implements StructuredSerializer<FormData> {
  @override
  final Iterable<Type> types = const [FormData, _$FormData];
  @override
  final String wireName = 'FormData';

  @override
  Iterable<Object?> serialize(Serializers serializers, FormData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'signatures',
      serializers.serialize(object.signatures,
          specifiedType: const FullType(
              Map, const [const FullType(UserSummary), const FullType(bool)])),
    ];

    return result;
  }

  @override
  FormData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FormDataBuilder();

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
        case 'signatures':
          result.signatures = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(UserSummary),
                const FullType(bool)
              ]))! as Map<UserSummary, bool>;
          break;
      }
    }

    return result.build();
  }
}

class _$FormData extends FormData {
  @override
  final String title;
  @override
  final String description;
  @override
  final Map<UserSummary, bool> signatures;

  factory _$FormData([void Function(FormDataBuilder)? updates]) =>
      (new FormDataBuilder()..update(updates))._build();

  _$FormData._(
      {required this.title,
      required this.description,
      required this.signatures})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'FormData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'FormData', 'description');
    BuiltValueNullFieldError.checkNotNull(
        signatures, r'FormData', 'signatures');
  }

  @override
  FormData rebuild(void Function(FormDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormDataBuilder toBuilder() => new FormDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormData &&
        title == other.title &&
        description == other.description &&
        signatures == other.signatures;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, signatures.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FormData')
          ..add('title', title)
          ..add('description', description)
          ..add('signatures', signatures))
        .toString();
  }
}

class FormDataBuilder implements Builder<FormData, FormDataBuilder> {
  _$FormData? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  Map<UserSummary, bool>? _signatures;
  Map<UserSummary, bool>? get signatures => _$this._signatures;
  set signatures(Map<UserSummary, bool>? signatures) =>
      _$this._signatures = signatures;

  FormDataBuilder();

  FormDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _signatures = $v.signatures;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FormData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FormData;
  }

  @override
  void update(void Function(FormDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormData build() => _build();

  _$FormData _build() {
    final _$result = _$v ??
        new _$FormData._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'FormData', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'FormData', 'description'),
            signatures: BuiltValueNullFieldError.checkNotNull(
                signatures, r'FormData', 'signatures'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
