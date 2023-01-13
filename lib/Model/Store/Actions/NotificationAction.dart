import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../Data/UserNotification.dart';
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
      return state.modified(GlobalStateProperty.notifications, <UserNotification>[]);
    }
    else if (add) {
      List<UserNotification> mutated = state.notifications;
      mutated.add(notification!);
      await preferences.setStringList("notifications", mutated.map((n) => n.stringify()).toList());
      return state.modified(GlobalStateProperty.notifications, mutated);
    }
    else if (retrieve) {
      return state.modified(
          GlobalStateProperty.notifications, 
          (preferences.getStringList("notifications") ?? []).map((n) => UserNotification.fromString(n)).toList()
      );
    }
    else {
      List<UserNotification> mutated = state.notifications;
      mutated.remove(notification);
      await preferences.setStringList("notifications", mutated.map((n) => n.stringify()).toList());
      return state.modified(GlobalStateProperty.notifications, mutated);
    }
  }
}