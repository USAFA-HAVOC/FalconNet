import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UserSettings.g.dart';

abstract class UserSettings implements Built<UserSettings, UserSettingsBuilder> {
  static Serializer<UserSettings> get serializer => _$userSettingsSerializer;

  String get theme;
  bool get pushNotifications;
  bool get diPush;
  bool get passPush;
  bool get taskPush;

  UserSettings._();
  factory UserSettings([void Function(UserSettingsBuilder) updates]) = _$UserSettings;
}