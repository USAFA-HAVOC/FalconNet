import 'package:async_redux/async_redux.dart';
import 'package:built_collection/src/list.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import "../../Store/Connection/Connection.dart" as connection;

class NotificationAction extends ReduxAction<GlobalState> {
  final UserNotification? notification;
  final bool all;
  final bool add;
  final bool retrieve;

  NotificationAction.dismiss(this.notification) : 
        all = false, 
        add = false, 
        retrieve = false;

  NotificationAction.dismissAll() : 
        all = true, 
        notification = null, 
        add = false, 
        retrieve = false;
  
  NotificationAction.add(this.notification) : 
        all = false, 
        add = true, 
        retrieve = false;
  
  NotificationAction.retrieve() : 
        notification = null, 
        all = false, 
        add = false, 
        retrieve = true;

  @override
  Future<GlobalState?> reduce() async {
    var preferences = await connection.preferences;
    if (all) {
      await preferences.setStringList("notifications", <String>[]);
      return (state.toBuilder()..notifications.clear()).build();
    }
    else if (add) {
      List<UserNotification> mutated = state.notifications.toList(growable: false);
      mutated.add(notification!);
      await preferences.setStringList("notifications", mutated.map((n) => n.stringify()).toList());
      return (state.toBuilder()..notifications=ListBuilder<UserNotification>(mutated)).build();
    }
    else if (retrieve) {
      return (
          state.toBuilder()
            ..notifications=ListBuilder<UserNotification>(
                (preferences.getStringList("notifications") ?? []).map((n) => UserNotification.fromString(n)).toList()
            )
      ).build();
    }
    else {
      List<UserNotification> mutated = state.notifications.toList(growable: false);
      mutated.remove(notification);
      await preferences.setStringList("notifications", mutated.map((n) => n.stringify()).toList());
      return (state.toBuilder()..notifications=ListBuilder<UserNotification>(mutated)).build();
    }
  }
}