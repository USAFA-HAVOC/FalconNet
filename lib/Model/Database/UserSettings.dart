import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part "UserSettings.g.dart";

abstract class UserSettings implements Built<UserSettings, UserSettingsBuilder> {
  static Serializer<UserSettings> get serializer => _$userSettingsSerializer;

  bool get darkTheme;
  bool get pushNotifications;
  bool get diPush;
  bool get passPush;
  bool get taskPush;

  UserSettings._();
  factory UserSettings([void Function(UserSettingsBuilder) updates]) = _$UserSettings;
}


/*
class UserSettings {
  bool darkTheme;
  bool pushNotifications;
  bool diPush;
  bool passPush;
  bool taskPush;

  UserSettings(this.darkTheme, this.pushNotifications, this.diPush, this.passPush, this.taskPush);

  UserSettings modified(UserSettingsProperty property, bool value) {
    switch (property) {
      case UserSettingsProperty.darkTheme:
        return UserSettings(value, pushNotifications, diPush, passPush, taskPush);
      case UserSettingsProperty.pushNotifications:
        return UserSettings(darkTheme, value, diPush, passPush, taskPush);
      case UserSettingsProperty.diPush:
        return UserSettings(darkTheme, pushNotifications, value, passPush, taskPush);
      case UserSettingsProperty.passPush:
        return UserSettings(value, pushNotifications, diPush, value, taskPush);
      case UserSettingsProperty.taskPush:
        return UserSettings(value, pushNotifications, diPush, passPush, value);
    }
  }
}

enum UserSettingsProperty {
  darkTheme,
  pushNotifications,
  diPush,
  passPush,
  taskPush,
}
 */