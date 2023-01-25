// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GlobalStateModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GlobalState> _$globalStateSerializer = new _$GlobalStateSerializer();

class _$GlobalStateSerializer implements StructuredSerializer<GlobalState> {
  @override
  final Iterable<Type> types = const [GlobalState, _$GlobalState];
  @override
  final String wireName = 'GlobalState';

  @override
  Iterable<Object?> serialize(Serializers serializers, GlobalState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'history',
      serializers.serialize(object.history,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CadetPass)])),
      'notifications',
      serializers.serialize(object.notifications,
          specifiedType: const FullType(
              BuiltList, const [const FullType(UserNotification)])),
      'settings',
      serializers.serialize(object.settings,
          specifiedType: const FullType(UserSettings)),
      'grades',
      serializers.serialize(object.grades,
          specifiedType: const FullType(UserGrades)),
      'forms',
      serializers.serialize(object.forms,
          specifiedType:
              const FullType(BuiltList, const [const FullType(FormOne)])),
      'roles',
      serializers.serialize(object.roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.leave;
    if (value != null) {
      result
        ..add('leave')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetLeave)));
    }
    value = object.pass;
    if (value != null) {
      result
        ..add('pass')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CadetPass)));
    }
    return result;
  }

  @override
  GlobalState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GlobalStateBuilder();

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
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CadetPass)]))!
              as BuiltList<Object?>);
          break;
        case 'notifications':
          result.notifications.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserNotification)]))!
              as BuiltList<Object?>);
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserSettings))! as UserSettings);
          break;
        case 'grades':
          result.grades.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserGrades))! as UserGrades);
          break;
        case 'forms':
          result.forms.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FormOne)]))!
              as BuiltList<Object?>);
          break;
        case 'roles':
          result.roles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'leave':
          result.leave.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetLeave))! as CadetLeave);
          break;
        case 'pass':
          result.pass.replace(serializers.deserialize(value,
              specifiedType: const FullType(CadetPass))! as CadetPass);
          break;
      }
    }

    return result.build();
  }
}

class _$GlobalState extends GlobalState {
  @override
  final User user;
  @override
  final BuiltList<CadetPass> history;
  @override
  final BuiltList<UserNotification> notifications;
  @override
  final UserSettings settings;
  @override
  final UserGrades grades;
  @override
  final BuiltList<FormOne> forms;
  @override
  final BuiltList<String> roles;
  @override
  final CadetLeave? leave;
  @override
  final CadetPass? pass;

  factory _$GlobalState([void Function(GlobalStateBuilder)? updates]) =>
      (new GlobalStateBuilder()..update(updates))._build();

  _$GlobalState._(
      {required this.user,
      required this.history,
      required this.notifications,
      required this.settings,
      required this.grades,
      required this.forms,
      required this.roles,
      this.leave,
      this.pass})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user, r'GlobalState', 'user');
    BuiltValueNullFieldError.checkNotNull(history, r'GlobalState', 'history');
    BuiltValueNullFieldError.checkNotNull(
        notifications, r'GlobalState', 'notifications');
    BuiltValueNullFieldError.checkNotNull(settings, r'GlobalState', 'settings');
    BuiltValueNullFieldError.checkNotNull(grades, r'GlobalState', 'grades');
    BuiltValueNullFieldError.checkNotNull(forms, r'GlobalState', 'forms');
    BuiltValueNullFieldError.checkNotNull(roles, r'GlobalState', 'roles');
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
        user == other.user &&
        history == other.history &&
        notifications == other.notifications &&
        settings == other.settings &&
        grades == other.grades &&
        forms == other.forms &&
        roles == other.roles &&
        leave == other.leave &&
        pass == other.pass;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, grades.hashCode);
    _$hash = $jc(_$hash, forms.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, leave.hashCode);
    _$hash = $jc(_$hash, pass.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GlobalState')
          ..add('user', user)
          ..add('history', history)
          ..add('notifications', notifications)
          ..add('settings', settings)
          ..add('grades', grades)
          ..add('forms', forms)
          ..add('roles', roles)
          ..add('leave', leave)
          ..add('pass', pass))
        .toString();
  }
}

class GlobalStateBuilder implements Builder<GlobalState, GlobalStateBuilder> {
  _$GlobalState? _$v;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  ListBuilder<CadetPass>? _history;
  ListBuilder<CadetPass> get history =>
      _$this._history ??= new ListBuilder<CadetPass>();
  set history(ListBuilder<CadetPass>? history) => _$this._history = history;

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

  ListBuilder<FormOne>? _forms;
  ListBuilder<FormOne> get forms =>
      _$this._forms ??= new ListBuilder<FormOne>();
  set forms(ListBuilder<FormOne>? forms) => _$this._forms = forms;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= new ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

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
      _user = $v.user.toBuilder();
      _history = $v.history.toBuilder();
      _notifications = $v.notifications.toBuilder();
      _settings = $v.settings.toBuilder();
      _grades = $v.grades.toBuilder();
      _forms = $v.forms.toBuilder();
      _roles = $v.roles.toBuilder();
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
              user: user.build(),
              history: history.build(),
              notifications: notifications.build(),
              settings: settings.build(),
              grades: grades.build(),
              forms: forms.build(),
              roles: roles.build(),
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
        _$failedField = 'roles';
        roles.build();
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
