import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utility/ErrorFormatting.dart';

class SettingsAction extends ReduxAction<GlobalState> {
  final UserSettingsBuilder Function(UserSettingsBuilder b)? modify;
  final void Function()? onFail;
  final void Function()? onSucceed;

  SettingsAction({required this.modify, this.onFail, this.onSucceed});

  SettingsAction.retrieve({this.onFail, this.onSucceed}) : modify = null;

  @override
  Future<GlobalState?> reduce() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (modify != null) {
        var modified = modify!(state.settings.toBuilder());
        var serialized = serializers.toJson(UserSettings.serializer, modified.build()).replaceAll("\"", "*");
        await preferences.setString("settings", serialized);
        onSucceed?.call();
        return (state.toBuilder()..settings=modified).build();
      }
      else {
        var serialized = preferences.getString("settings")?.replaceAll("*", "\"");
        if (serialized != null) {
          UserSettings newSettings = serializers.fromJson(UserSettings.serializer, serialized)!;
          onSucceed?.call();
          return (state.toBuilder()..settings=newSettings.toBuilder()).build();
        }
        else {
          dispatch(SettingsAction(modify: (b) => state.settings.toBuilder(), onSucceed: onSucceed, onFail: onFail));
          return null;
        }
      }
    }
    catch (e) {
      displayError(prefix: "Settings", exception: e);
      onFail?.call();
      return null;
    }
  }
}