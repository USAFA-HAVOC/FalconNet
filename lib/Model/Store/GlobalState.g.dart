// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GlobalState.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GlobalState extends GlobalState {
  @override
  final AppStatus status;
  @override
  final User user;
  @override
  final PassHistoryModel history;
  @override
  final UserSettings settings;
  @override
  final UserGrades grades;
  @override
  final BuiltList<UserEvent> events;

  factory _$GlobalState([void Function(GlobalStateBuilder)? updates]) =>
      (new GlobalStateBuilder()..update(updates))._build();

  _$GlobalState._(
      {required this.status,
      required this.user,
      required this.history,
      required this.settings,
      required this.grades,
      required this.events})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'GlobalState', 'status');
    BuiltValueNullFieldError.checkNotNull(user, r'GlobalState', 'user');
    BuiltValueNullFieldError.checkNotNull(history, r'GlobalState', 'history');
    BuiltValueNullFieldError.checkNotNull(settings, r'GlobalState', 'settings');
    BuiltValueNullFieldError.checkNotNull(grades, r'GlobalState', 'grades');
    BuiltValueNullFieldError.checkNotNull(events, r'GlobalState', 'events');
  }

  @override
  GlobalState rebuild(void Function(GlobalStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalStateBuilder toBuilder() => new GlobalStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalState &&
        status == other.status &&
        user == other.user &&
        history == other.history &&
        settings == other.settings &&
        grades == other.grades &&
        events == other.events;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, grades.hashCode);
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GlobalState')
          ..add('status', status)
          ..add('user', user)
          ..add('history', history)
          ..add('settings', settings)
          ..add('grades', grades)
          ..add('events', events))
        .toString();
  }
}

class GlobalStateBuilder implements Builder<GlobalState, GlobalStateBuilder> {
  _$GlobalState? _$v;

  AppStatus? _status;
  AppStatus? get status => _$this._status;
  set status(AppStatus? status) => _$this._status = status;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  PassHistoryModelBuilder? _history;
  PassHistoryModelBuilder get history =>
      _$this._history ??= new PassHistoryModelBuilder();
  set history(PassHistoryModelBuilder? history) => _$this._history = history;

  UserSettingsBuilder? _settings;
  UserSettingsBuilder get settings =>
      _$this._settings ??= new UserSettingsBuilder();
  set settings(UserSettingsBuilder? settings) => _$this._settings = settings;

  UserGradesBuilder? _grades;
  UserGradesBuilder get grades => _$this._grades ??= new UserGradesBuilder();
  set grades(UserGradesBuilder? grades) => _$this._grades = grades;

  ListBuilder<UserEvent>? _events;
  ListBuilder<UserEvent> get events =>
      _$this._events ??= new ListBuilder<UserEvent>();
  set events(ListBuilder<UserEvent>? events) => _$this._events = events;

  GlobalStateBuilder();

  GlobalStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _user = $v.user.toBuilder();
      _history = $v.history.toBuilder();
      _settings = $v.settings.toBuilder();
      _grades = $v.grades.toBuilder();
      _events = $v.events.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GlobalState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GlobalState;
  }

  @override
  void update(void Function(GlobalStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GlobalState build() => _build();

  _$GlobalState _build() {
    _$GlobalState _$result;
    try {
      _$result = _$v ??
          new _$GlobalState._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GlobalState', 'status'),
              user: user.build(),
              history: history.build(),
              settings: settings.build(),
              grades: grades.build(),
              events: events.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'history';
        history.build();
        _$failedField = 'settings';
        settings.build();
        _$failedField = 'grades';
        grades.build();
        _$failedField = 'events';
        events.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GlobalState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
