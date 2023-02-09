// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GradeSubmission.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GradeSubmission> _$gradeSubmissionSerializer =
    new _$GradeSubmissionSerializer();

class _$GradeSubmissionSerializer
    implements StructuredSerializer<GradeSubmission> {
  @override
  final Iterable<Type> types = const [GradeSubmission, _$GradeSubmission];
  @override
  final String wireName = 'GradeSubmission';

  @override
  Iterable<Object?> serialize(Serializers serializers, GradeSubmission object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'ami',
      serializers.serialize(object.ami, specifiedType: const FullType(bool)),
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(int)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GradeSubmission deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GradeSubmissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ami':
          result.ami = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GradeSubmission extends GradeSubmission {
  @override
  final String id;
  @override
  final bool ami;
  @override
  final int number;
  @override
  final int value;
  @override
  final String description;

  factory _$GradeSubmission([void Function(GradeSubmissionBuilder)? updates]) =>
      (new GradeSubmissionBuilder()..update(updates))._build();

  _$GradeSubmission._(
      {required this.id,
      required this.ami,
      required this.number,
      required this.value,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GradeSubmission', 'id');
    BuiltValueNullFieldError.checkNotNull(ami, r'GradeSubmission', 'ami');
    BuiltValueNullFieldError.checkNotNull(number, r'GradeSubmission', 'number');
    BuiltValueNullFieldError.checkNotNull(value, r'GradeSubmission', 'value');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GradeSubmission', 'description');
  }

  @override
  GradeSubmission rebuild(void Function(GradeSubmissionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GradeSubmissionBuilder toBuilder() =>
      new GradeSubmissionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradeSubmission &&
        id == other.id &&
        ami == other.ami &&
        number == other.number &&
        value == other.value &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ami.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GradeSubmission')
          ..add('id', id)
          ..add('ami', ami)
          ..add('number', number)
          ..add('value', value)
          ..add('description', description))
        .toString();
  }
}

class GradeSubmissionBuilder
    implements Builder<GradeSubmission, GradeSubmissionBuilder> {
  _$GradeSubmission? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _ami;
  bool? get ami => _$this._ami;
  set ami(bool? ami) => _$this._ami = ami;

  int? _number;
  int? get number => _$this._number;
  set number(int? number) => _$this._number = number;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GradeSubmissionBuilder();

  GradeSubmissionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ami = $v.ami;
      _number = $v.number;
      _value = $v.value;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GradeSubmission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GradeSubmission;
  }

  @override
  void update(void Function(GradeSubmissionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GradeSubmission build() => _build();

  _$GradeSubmission _build() {
    final _$result = _$v ??
        new _$GradeSubmission._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GradeSubmission', 'id'),
            ami: BuiltValueNullFieldError.checkNotNull(
                ami, r'GradeSubmission', 'ami'),
            number: BuiltValueNullFieldError.checkNotNull(
                number, r'GradeSubmission', 'number'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GradeSubmission', 'value'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GradeSubmission', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
