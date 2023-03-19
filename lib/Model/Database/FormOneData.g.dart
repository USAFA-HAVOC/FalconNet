// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormOneData.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FormOneData> _$formOneDataSerializer = new _$FormOneDataSerializer();

class _$FormOneDataSerializer implements StructuredSerializer<FormOneData> {
  @override
  final Iterable<Type> types = const [FormOneData, _$FormOneData];
  @override
  final String wireName = 'FormOneData';

  @override
  Iterable<Object?> serialize(Serializers serializers, FormOneData object,
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
              BuiltMap, const [const FullType(String), const FullType(bool)])),
      'members',
      serializers.serialize(object.members,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserSummary)])),
    ];
    Object? value;
    value = object.form_id;
    if (value != null) {
      result
        ..add('form_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FormOneData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FormOneDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'form_id':
          result.form_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signatures':
          result.signatures.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'members':
          result.members.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserSummary)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FormOneData extends FormOneData {
  @override
  final String? form_id;
  @override
  final String title;
  @override
  final String description;
  @override
  final BuiltMap<String, bool> signatures;
  @override
  final BuiltList<UserSummary> members;

  factory _$FormOneData([void Function(FormOneDataBuilder)? updates]) =>
      (new FormOneDataBuilder()..update(updates))._build();

  _$FormOneData._(
      {this.form_id,
      required this.title,
      required this.description,
      required this.signatures,
      required this.members})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'FormOneData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'FormOneData', 'description');
    BuiltValueNullFieldError.checkNotNull(
        signatures, r'FormOneData', 'signatures');
    BuiltValueNullFieldError.checkNotNull(members, r'FormOneData', 'members');
  }

  @override
  FormOneData rebuild(void Function(FormOneDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormOneDataBuilder toBuilder() => new FormOneDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormOneData &&
        form_id == other.form_id &&
        title == other.title &&
        description == other.description &&
        signatures == other.signatures &&
        members == other.members;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, form_id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, signatures.hashCode);
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FormOneData')
          ..add('form_id', form_id)
          ..add('title', title)
          ..add('description', description)
          ..add('signatures', signatures)
          ..add('members', members))
        .toString();
  }
}

class FormOneDataBuilder implements Builder<FormOneData, FormOneDataBuilder> {
  _$FormOneData? _$v;

  String? _form_id;
  String? get form_id => _$this._form_id;
  set form_id(String? form_id) => _$this._form_id = form_id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  MapBuilder<String, bool>? _signatures;
  MapBuilder<String, bool> get signatures =>
      _$this._signatures ??= new MapBuilder<String, bool>();
  set signatures(MapBuilder<String, bool>? signatures) =>
      _$this._signatures = signatures;

  ListBuilder<UserSummary>? _members;
  ListBuilder<UserSummary> get members =>
      _$this._members ??= new ListBuilder<UserSummary>();
  set members(ListBuilder<UserSummary>? members) => _$this._members = members;

  FormOneDataBuilder();

  FormOneDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _form_id = $v.form_id;
      _title = $v.title;
      _description = $v.description;
      _signatures = $v.signatures.toBuilder();
      _members = $v.members.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FormOneData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FormOneData;
  }

  @override
  void update(void Function(FormOneDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormOneData build() => _build();

  _$FormOneData _build() {
    _$FormOneData _$result;
    try {
      _$result = _$v ??
          new _$FormOneData._(
              form_id: form_id,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'FormOneData', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'FormOneData', 'description'),
              signatures: signatures.build(),
              members: members.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'signatures';
        signatures.build();
        _$failedField = 'members';
        members.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FormOneData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
