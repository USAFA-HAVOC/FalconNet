import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/UserSettings.dart';

import '../GlobalState.dart';

class SettingsAction extends ReduxAction<GlobalState> {
  final UserSettingsProperty property;
  final dynamic value;

  SettingsAction({required this.property, required this.value});

  @override
  GlobalState? reduce() {
    return state.modified(GlobalStateProperty.settings, state.settings.modified(property, value));
  }
}