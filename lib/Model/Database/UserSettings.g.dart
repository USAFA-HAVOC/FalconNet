// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserSettings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSettings> _$userSettingsSerializer =
    new _$UserSettingsSerializer();

class _$UserSettingsSerializer implements StructuredSerializer<UserSettings> {
  @override
  final Iterable<Type> types = const [UserSettings, _$UserSettings];
  @override
  final String wireName = 'UserSettings';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'theme',
      serializers.serialize(object.theme,
          specifiedType: const FullType(String)),
      'pushNotifications',
      serializers.serialize(object.pushNotifications,
          specifiedType: const FullType(bool)),
      'diPush',
      serializers.serialize(object.diPush, specifiedType: const FullType(bool)),
      'passPush',
      serializers.serialize(object.passPush,
          specifiedType: const FullType(bool)),
      'taskPush',
      serializers.serialize(object.taskPush,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UserSettings deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'theme':
          result.theme = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pushNotifications':
          result.pushNotifications = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'diPush':
          result.diPush = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'passPush':
          result.passPush = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'taskPush':
          result.taskPush = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSettings extends UserSettings {
  @override
  final String theme;
  @override
  final bool pushNotifications;
  @override
  final bool diPush;
  @override
  final bool passPush;
  @override
  final bool taskPush;

  factory _$UserSettings([void Function(UserSettingsBuilder)? updates]) =>
      (new UserSettingsBuilder()..update(updates))._build();

  _$UserSettings._(
      {required this.theme,
      required this.pushNotifications,
      required this.diPush,
      required this.passPush,
      required this.taskPush})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(theme, r'UserSettings', 'theme');
    BuiltValueNullFieldError.checkNotNull(
        pushNotifications, r'UserSettings', 'pushNotifications');
    BuiltValueNullFieldError.checkNotNull(diPush, r'UserSettings', 'diPush');
    BuiltValueNullFieldError.checkNotNull(
        passPush, r'UserSettings', 'passPush');
    BuiltValueNullFieldError.checkNotNull(
        taskPush, r'UserSettings', 'taskPush');
  }

  @override
  UserSettings rebuild(void Function(UserSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSettingsBuilder toBuilder() => new UserSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSettings &&
        theme == other.theme &&
        pushNotifications == other.pushNotifications &&
        diPush == other.diPush &&
        passPush == other.passPush &&
        taskPush == other.taskPush;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, theme.hashCode);
    _$hash = $jc(_$hash, pushNotifications.hashCode);
    _$hash = $jc(_$hash, diPush.hashCode);
    _$hash = $jc(_$hash, passPush.hashCode);
    _$hash = $jc(_$hash, taskPush.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSettings')
          ..add('theme', theme)
          ..add('pushNotifications', pushNotifications)
          ..add('diPush', diPush)
          ..add('passPush', passPush)
          ..add('taskPush', taskPush))
        .toString();
  }
}

class UserSettingsBuilder
    implements Builder<UserSettings, UserSettingsBuilder> {
  _$UserSettings? _$v;

  String? _theme;
  String? get theme => _$this._theme;
  set theme(String? theme) => _$this._theme = theme;

  bool? _pushNotifications;
  bool? get pushNotifications => _$this._pushNotifications;
  set pushNotifications(bool? pushNotifications) =>
      _$this._pushNotifications = pushNotifications;

  bool? _diPush;
  bool? get diPush => _$this._diPush;
  set diPush(bool? diPush) => _$this._diPush = diPush;

  bool? _passPush;
  bool? get passPush => _$this._passPush;
  set passPush(bool? passPush) => _$this._passPush = passPush;

  bool? _taskPush;
  bool? get taskPush => _$this._taskPush;
  set taskPush(bool? taskPush) => _$this._taskPush = taskPush;

  UserSettingsBuilder();

  UserSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _theme = $v.theme;
      _pushNotifications = $v.pushNotifications;
      _diPush = $v.diPush;
      _passPush = $v.passPush;
      _taskPush = $v.taskPush;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSettings;
  }

  @override
  void update(void Function(UserSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSettings build() => _build();

  _$UserSettings _build() {
    final _$result = _$v ??
        new _$UserSettings._(
            theme: BuiltValueNullFieldError.checkNotNull(
                theme, r'UserSettings', 'theme'),
            pushNotifications: BuiltValueNullFieldError.checkNotNull(
                pushNotifications, r'UserSettings', 'pushNotifications'),
            diPush: BuiltValueNullFieldError.checkNotNull(
                diPush, r'UserSettings', 'diPush'),
            passPush: BuiltValueNullFieldError.checkNotNull(
                passPush, r'UserSettings', 'passPush'),
            taskPush: BuiltValueNullFieldError.checkNotNull(
                taskPush, r'UserSettings', 'taskPush'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
