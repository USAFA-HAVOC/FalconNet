import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

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