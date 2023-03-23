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
  final BuiltList<UserNotification> notifications;
  @override
  final UserSettings settings;
  @override
  final UserGrades grades;
  @override
  final BuiltList<FormSummary> forms;
  @override
  final CadetLeave? leave;
  @override
  final CadetPass? pass;

  factory _$GlobalState([void Function(GlobalStateBuilder)? updates]) =>
      (new GlobalStateBuilder()..update(updates))._build();

  _$GlobalState._(
      {required this.status,
      required this.user,
      required this.history,
      required this.notifications,
      required this.settings,
      required this.grades,
      required this.forms,
      this.leave,
      this.pass})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'GlobalState', 'status');
    BuiltValueNullFieldError.checkNotNull(user, r'GlobalState', 'user');
    BuiltValueNullFieldError.checkNotNull(history, r'GlobalState', 'history');
    BuiltValueNullFieldError.checkNotNull(
        notifications, r'GlobalState', 'notifications');
    BuiltValueNullFieldError.checkNotNull(settings, r'GlobalState', 'settings');
    BuiltValueNullFieldError.checkNotNull(grades, r'GlobalState', 'grades');
    BuiltValueNullFieldError.checkNotNull(forms, r'GlobalState', 'forms');
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
        notifications == other.notifications &&
        settings == other.settings &&
        grades == other.grades &&
        forms == other.forms &&
        leave == other.leave &&
        pass == other.pass;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, grades.hashCode);
    _$hash = $jc(_$hash, forms.hashCode);
    _$hash = $jc(_$hash, leave.hashCode);
    _$hash = $jc(_$hash, pass.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GlobalState')
          ..add('status', status)
          ..add('user', user)
          ..add('history', history)
          ..add('notifications', notifications)
          ..add('settings', settings)
          ..add('grades', grades)
          ..add('forms', forms)
          ..add('leave', leave)
          ..add('pass', pass))
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

  ListBuilder<UserNotification>? _notifications;
  ListBuilder<UserNotification> get notifications =>
      _$this._notifications ??= new ListBuilder<UserNotification>();
  set notifications(ListBuilder<UserNotification>? notifications) =>
      _$this._notifications = notifications;

  UserSettingsBuilder? _settings;
  UserSettingsBuilder get settings =>
      _$this._settings ??= new UserSettingsBuilder();
  set settings(UserSettingsBuilder? settings) => _$this._settings = settings;

  UserGradesBuilder? _grades;
  UserGradesBuilder get grades => _$this._grades ??= new UserGradesBuilder();
  set grades(UserGradesBuilder? grades) => _$this._grades = grades;

  ListBuilder<FormSummary>? _forms;
  ListBuilder<FormSummary> get forms =>
      _$this._forms ??= new ListBuilder<FormSummary>();
  set forms(ListBuilder<FormSummary>? forms) => _$this._forms = forms;

  CadetLeaveBuilder? _leave;
  CadetLeaveBuilder get leave => _$this._leave ??= new CadetLeaveBuilder();
  set leave(CadetLeaveBuilder? leave) => _$this._leave = leave;

  CadetPassBuilder? _pass;
  CadetPassBuilder get pass => _$this._pass ??= new CadetPassBuilder();
  set pass(CadetPassBuilder? pass) => _$this._pass = pass;

  GlobalStateBuilder();

  GlobalStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _user = $v.user.toBuilder();
      _history = $v.history.toBuilder();
      _notifications = $v.notifications.toBuilder();
      _settings = $v.settings.toBuilder();
      _grades = $v.grades.toBuilder();
      _forms = $v.forms.toBuilder();
      _leave = $v.leave?.toBuilder();
      _pass = $v.pass?.toBuilder();
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
              notifications: notifications.build(),
              settings: settings.build(),
              grades: grades.build(),
              forms: forms.build(),
              leave: _leave?.build(),
              pass: _pass?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'history';
        history.build();
        _$failedField = 'notifications';
        notifications.build();
        _$failedField = 'settings';
        settings.build();
        _$failedField = 'grades';
        grades.build();
        _$failedField = 'forms';
        forms.build();
        _$failedField = 'leave';
        _leave?.build();
        _$failedField = 'pass';
        _pass?.build();
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
