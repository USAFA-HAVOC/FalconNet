// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitGrades.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitGrades> _$unitGradesSerializer = new _$UnitGradesSerializer();

class _$UnitGradesSerializer implements StructuredSerializer<UnitGrades> {
  @override
  final Iterable<Type> types = const [UnitGrades, _$UnitGrades];
  @override
  final String wireName = 'UnitGrades';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitGrades object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'members',
      serializers.serialize(object.members,
          specifiedType:
              const FullType(List, const [const FullType(UserSummary)])),
      'grades',
      serializers.serialize(object.grades,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(UserGrades)])),
    ];

    return result;
  }

  @override
  UnitGrades deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitGradesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'members':
          result.members = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(UserSummary)]))!
              as List<UserSummary>;
          break;
        case 'grades':
          result.grades = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(UserGrades)
              ]))! as Map<String, UserGrades>;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitGrades extends UnitGrades {
  @override
  final List<UserSummary> members;
  @override
  final Map<String, UserGrades> grades;

  factory _$UnitGrades([void Function(UnitGradesBuilder)? updates]) =>
      (new UnitGradesBuilder()..update(updates))._build();

  _$UnitGrades._({required this.members, required this.grades}) : super._() {
    BuiltValueNullFieldError.checkNotNull(members, r'UnitGrades', 'members');
    BuiltValueNullFieldError.checkNotNull(grades, r'UnitGrades', 'grades');
  }

  @override
  UnitGrades rebuild(void Function(UnitGradesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitGradesBuilder toBuilder() => new UnitGradesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitGrades &&
        members == other.members &&
        grades == other.grades;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jc(_$hash, grades.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitGrades')
          ..add('members', members)
          ..add('grades', grades))
        .toString();
  }
}

class UnitGradesBuilder implements Builder<UnitGrades, UnitGradesBuilder> {
  _$UnitGrades? _$v;

  List<UserSummary>? _members;
  List<UserSummary>? get members => _$this._members;
  set members(List<UserSummary>? members) => _$this._members = members;

  Map<String, UserGrades>? _grades;
  Map<String, UserGrades>? get grades => _$this._grades;
  set grades(Map<String, UserGrades>? grades) => _$this._grades = grades;

  UnitGradesBuilder();

  UnitGradesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _members = $v.members;
      _grades = $v.grades;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitGrades other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitGrades;
  }

  @override
  void update(void Function(UnitGradesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitGrades build() => _build();

  _$UnitGrades _build() {
    final _$result = _$v ??
        new _$UnitGrades._(
            members: BuiltValueNullFieldError.checkNotNull(
                members, r'UnitGrades', 'members'),
            grades: BuiltValueNullFieldError.checkNotNull(
                grades, r'UnitGrades', 'grades'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
