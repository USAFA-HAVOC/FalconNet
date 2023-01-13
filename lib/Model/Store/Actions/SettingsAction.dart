import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/UserSettings.dart';
import '../Connection/Connection.dart' as connection;
import '../GlobalState.dart';

class SettingsAction extends ReduxAction<GlobalState> {
  final UserSettingsProperty? property;
  final dynamic value;

  SettingsAction({required this.property, required this.value});

  SettingsAction.retrieve() : property = null, value = null;

  @override
  Future<GlobalState?> reduce() async {
    var preferences = await connection.preferences;
    if (property != null) {
      if (property == UserSettingsProperty.pushNotifications) {
        await preferences.setBool("settings/${UserSettingsProperty.pushNotifications.name}", value as bool);
        await preferences.setBool("settings/${UserSettingsProperty.diPush.name}", value as bool);
        await preferences.setBool("settings/${UserSettingsProperty.passPush.name}", value as bool);
        await preferences.setBool("settings/${UserSettingsProperty.taskPush.name}", value as bool);
        return state.modified(
          GlobalStateProperty.settings,
          state.settings
            .modified(property!, value)
            .modified(UserSettingsProperty.diPush, value)
            .modified(UserSettingsProperty.passPush, value)
            .modified(UserSettingsProperty.taskPush, value)
        );
      }
      else {
        await preferences.setBool("settings/${property!.name}", value as bool);
        return state.modified(GlobalStateProperty.settings, state.settings.modified(property!, value));
      }
    }
    else {
      var mutable = state.settings;
      for (var setting in UserSettingsProperty.values) {
        var value = preferences.getBool("settings/${setting.name}");
        mutable = mutable.modified(setting, value ?? false);
      }
      return state.modified(GlobalStateProperty.settings, mutable);
    }
  }
}