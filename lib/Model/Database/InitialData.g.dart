// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InitialData.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitialData> _$initialDataSerializer = new _$InitialDataSerializer();

class _$InitialDataSerializer implements StructuredSerializer<InitialData> {
  @override
  final Iterable<Type> types = const [InitialData, _$InitialData];
  @override
  final String wireName = 'InitialData';

  @override
  Iterable<Object?> serialize(Serializers serializers, InitialData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
    ];
    Object? value;
    value = object.grades;
    if (value != null) {
      result
        ..add('grades')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserGrades)));
    }
    value = object.pass_history;
    if (value != null) {
      result
        ..add('pass_history')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PassHistoryModel)));
    }
    value = object.events;
    if (value != null) {
      result
        ..add('events')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AccountabilityEvent)])));
    }
    return result;
  }

  @override
  InitialData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitialDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'grades':
          result.grades.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserGrades))! as UserGrades);
          break;
        case 'pass_history':
          result.pass_history.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PassHistoryModel))!
              as PassHistoryModel);
          break;
        case 'events':
          result.events.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AccountabilityEvent)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$InitialData extends InitialData {
  @override
  final User user;
  @override
  final UserGrades? grades;
  @override
  final PassHistoryModel? pass_history;
  @override
  final BuiltList<AccountabilityEvent>? events;

  factory _$InitialData([void Function(InitialDataBuilder)? updates]) =>
      (new InitialDataBuilder()..update(updates))._build();

  _$InitialData._(
      {required this.user, this.grades, this.pass_history, this.events})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user, r'InitialData', 'user');
  }

  @override
  InitialData rebuild(void Function(InitialDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitialDataBuilder toBuilder() => new InitialDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitialData &&
        user == other.user &&
        grades == other.grades &&
        pass_history == other.pass_history &&
        events == other.events;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, grades.hashCode);
    _$hash = $jc(_$hash, pass_history.hashCode);
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitialData')
          ..add('user', user)
          ..add('grades', grades)
          ..add('pass_history', pass_history)
          ..add('events', events))
        .toString();
  }
}

class InitialDataBuilder implements Builder<InitialData, InitialDataBuilder> {
  _$InitialData? _$v;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  UserGradesBuilder? _grades;
  UserGradesBuilder get grades => _$this._grades ??= new UserGradesBuilder();
  set grades(UserGradesBuilder? grades) => _$this._grades = grades;

  PassHistoryModelBuilder? _pass_history;
  PassHistoryModelBuilder get pass_history =>
      _$this._pass_history ??= new PassHistoryModelBuilder();
  set pass_history(PassHistoryModelBuilder? pass_history) =>
      _$this._pass_history = pass_history;

  ListBuilder<AccountabilityEvent>? _events;
  ListBuilder<AccountabilityEvent> get events =>
      _$this._events ??= new ListBuilder<AccountabilityEvent>();
  set events(ListBuilder<AccountabilityEvent>? events) =>
      _$this._events = events;

  InitialDataBuilder();

  InitialDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user.toBuilder();
      _grades = $v.grades?.toBuilder();
      _pass_history = $v.pass_history?.toBuilder();
      _events = $v.events?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitialData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitialData;
  }

  @override
  void update(void Function(InitialDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitialData build() => _build();

  _$InitialData _build() {
    _$InitialData _$result;
    try {
      _$result = _$v ??
          new _$InitialData._(
              user: user.build(),
              grades: _grades?.build(),
              pass_history: _pass_history?.build(),
              events: _events?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'grades';
        _grades?.build();
        _$failedField = 'pass_history';
        _pass_history?.build();
        _$failedField = 'events';
        _events?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InitialData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
