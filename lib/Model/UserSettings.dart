import 'package:falcon_net/Model/GlobalState.dart';

class UserSettings implements StateObject {
  final bool darkTheme;
  final bool pushNotifications;
  final bool diPush;
  final bool passPush;
  final bool taskPush;
  
  const UserSettings({
    required this.darkTheme, 
    required this.pushNotifications, 
    required this.diPush, 
    required this.passPush, 
    required this.taskPush
  });
  
  @override
  UserSettings modified(Enum k, dynamic value) {
    UserSettingsProperty key = k as UserSettingsProperty;
    switch (key) {
      case UserSettingsProperty.darkTheme: {
        return UserSettings(darkTheme: value, pushNotifications: pushNotifications, diPush: diPush, passPush: passPush, taskPush: taskPush);
      }
      case UserSettingsProperty.pushNotifications: {
        return UserSettings(darkTheme: darkTheme, pushNotifications: value, diPush: diPush, passPush: passPush, taskPush: taskPush);
      }
      case UserSettingsProperty.diPush: {
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: value, passPush: passPush, taskPush: taskPush);
      }
      case UserSettingsProperty.passPush: {
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: diPush, passPush: value, taskPush: taskPush);
      }
      case UserSettingsProperty.taskPush: {
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: diPush, passPush: passPush, taskPush: value);
      }
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