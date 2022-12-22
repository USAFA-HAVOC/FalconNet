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
  UserSettings modified(String key, dynamic value) {
    switch (key) {
      case "darkTheme": {
        return UserSettings(darkTheme: value, pushNotifications: pushNotifications, diPush: diPush, passPush: passPush, taskPush: taskPush);
      }
      case "pushNotifications": {
        return UserSettings(darkTheme: darkTheme, pushNotifications: value, diPush: diPush, passPush: passPush, taskPush: taskPush);
      }
      case "diPush": {
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: value, passPush: passPush, taskPush: taskPush);
      }
      case "passPush": {
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: diPush, passPush: value, taskPush: taskPush);
      }
      case "taskPush": {
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: diPush, passPush: passPush, taskPush: value);
      }
      default: {
        assert(false, "No such property");
        return UserSettings(darkTheme: darkTheme, pushNotifications: pushNotifications, diPush: diPush, passPush: passPush, taskPush: taskPush);
      }
    }
  }
}