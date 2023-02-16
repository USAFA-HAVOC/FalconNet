// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserGrades.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Grade> _$gradeSerializer = new _$GradeSerializer();
Serializer<UserGrades> _$userGradesSerializer = new _$UserGradesSerializer();

class _$GradeSerializer implements StructuredSerializer<Grade> {
  @override
  final Iterable<Type> types = const [Grade, _$Grade];
  @override
  final String wireName = 'Grade';

  @override
  Iterable<Object?> serialize(Serializers serializers, Grade object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'score',
      serializers.serialize(object.score, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Grade deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GradeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserGradesSerializer implements StructuredSerializer<UserGrades> {
  @override
  final Iterable<Type> types = const [UserGrades, _$UserGrades];
  @override
  final String wireName = 'UserGrades';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserGrades object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'amis',
      serializers.serialize(object.amis,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Grade)])),
      'samis',
      serializers.serialize(object.samis,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Grade)])),
    ];
    Object? value;
    value = object.pais;
    if (value != null) {
      result
        ..add('pais')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Grade)])));
    }
    return result;
  }

  @override
  UserGrades deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserGradesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'amis':
          result.amis.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Grade)]))!
              as BuiltList<Object?>);
          break;
        case 'samis':
          result.samis.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Grade)]))!
              as BuiltList<Object?>);
          break;
        case 'pais':
          result.pais.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Grade)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Grade extends Grade {
  @override
  final int score;
  @override
  final String? description;

  factory _$Grade([void Function(GradeBuilder)? updates]) =>
      (new GradeBuilder()..update(updates))._build();

  _$Grade._({required this.score, this.description}) : super._() {
    BuiltValueNullFieldError.checkNotNull(score, r'Grade', 'score');
  }

  @override
  Grade rebuild(void Function(GradeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GradeBuilder toBuilder() => new GradeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Grade &&
        score == other.score &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Grade')
          ..add('score', score)
          ..add('description', description))
        .toString();
  }
}

class GradeBuilder implements Builder<Grade, GradeBuilder> {
  _$Grade? _$v;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GradeBuilder();

  GradeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _score = $v.score;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Grade other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Grade;
  }

  @override
  void update(void Function(GradeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Grade build() => _build();

  _$Grade _build() {
    final _$result = _$v ??
        new _$Grade._(
            score:
                BuiltValueNullFieldError.checkNotNull(score, r'Grade', 'score'),
            description: description);
    replace(_$result);
    return _$result;
  }
}

class _$UserGrades extends UserGrades {
  @override
  final BuiltList<Grade> amis;
  @override
  final BuiltList<Grade> samis;
  @override
  final BuiltList<Grade>? pais;

  factory _$UserGrades([void Function(UserGradesBuilder)? updates]) =>
      (new UserGradesBuilder()..update(updates))._build();

  _$UserGrades._({required this.amis, required this.samis, this.pais})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(amis, r'UserGrades', 'amis');
    BuiltValueNullFieldError.checkNotNull(samis, r'UserGrades', 'samis');
  }

  @override
  UserGrades rebuild(void Function(UserGradesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserGradesBuilder toBuilder() => new UserGradesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserGrades &&
        amis == other.amis &&
        samis == other.samis &&
        pais == other.pais;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amis.hashCode);
    _$hash = $jc(_$hash, samis.hashCode);
    _$hash = $jc(_$hash, pais.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserGrades')
          ..add('amis', amis)
          ..add('samis', samis)
          ..add('pais', pais))
        .toString();
  }
}

class UserGradesBuilder implements Builder<UserGrades, UserGradesBuilder> {
  _$UserGrades? _$v;

  ListBuilder<Grade>? _amis;
  ListBuilder<Grade> get amis => _$this._amis ??= new ListBuilder<Grade>();
  set amis(ListBuilder<Grade>? amis) => _$this._amis = amis;

  ListBuilder<Grade>? _samis;
  ListBuilder<Grade> get samis => _$this._samis ??= new ListBuilder<Grade>();
  set samis(ListBuilder<Grade>? samis) => _$this._samis = samis;

  ListBuilder<Grade>? _pais;
  ListBuilder<Grade> get pais => _$this._pais ??= new ListBuilder<Grade>();
  set pais(ListBuilder<Grade>? pais) => _$this._pais = pais;

  UserGradesBuilder();

  UserGradesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amis = $v.amis.toBuilder();
      _samis = $v.samis.toBuilder();
      _pais = $v.pais?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserGrades other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserGrades;
  }

  @override
  void update(void Function(UserGradesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserGrades build() => _build();

  _$UserGrades _build() {
    _$UserGrades _$result;
    try {
      _$result = _$v ??
          new _$UserGrades._(
              amis: amis.build(), samis: samis.build(), pais: _pais?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'amis';
        amis.build();
        _$failedField = 'samis';
        samis.build();
        _$failedField = 'pais';
        _pais?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserGrades', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
