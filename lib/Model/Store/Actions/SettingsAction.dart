import 'package:async_redux/async_redux.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import '../Connection/Connection.dart' as connection;

class SettingsAction extends ReduxAction<GlobalState> {
  final UserSettingsBuilder Function(UserSettingsBuilder b)? modify;

  SettingsAction({required this.modify});

  SettingsAction.retrieve() : modify = null;

  @override
  Future<GlobalState?> reduce() async {
    var preferences = await connection.preferences;
    if (modify != null) {
      var modified = modify!(state.settings.toBuilder());
      await preferences.setString("settings", serializers.serialize(modified, specifiedType: const FullType(String)) as String);
      return (state.toBuilder()..settings=modified).build();
    }
    else {
      UserSettings newSettings = serializers.deserialize(preferences.getString("settings"), specifiedType: const FullType(UserSettings)) as UserSettings;
      return (state.toBuilder()..settings=newSettings.toBuilder()).build();
    }
  }
}