import 'package:async_redux/async_redux.dart';
import 'package:built_collection/src/list.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationAction extends ReduxAction<GlobalState> {
  final UserNotification? notification;
  final bool all;
  final bool add;
  final bool retrieve;
  final void Function()? onSucceed;
  final void Function()? onFail;

  NotificationAction.dismiss(this.notification, {this.onFail, this.onSucceed}) :
        all = false, 
        add = false, 
        retrieve = false;

  NotificationAction.dismissAll({this.onFail, this.onSucceed}) :
        all = true, 
        notification = null, 
        add = false, 
        retrieve = false;
  
  NotificationAction.add(this.notification, {this.onFail, this.onSucceed}) :
        all = false, 
        add = true, 
        retrieve = false;
  
  NotificationAction.retrieve({this.onFail, this.onSucceed}) :
        notification = null, 
        all = false, 
        add = false, 
        retrieve = true;

  @override
  Future<GlobalState?> reduce() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (all) {
        await preferences.setStringList("notifications", <String>[]);
        return (state.toBuilder()..notifications.clear()).build();
      }
      else if (add) {
        List<UserNotification> mutated = state.notifications.toList(growable: false);
        mutated.add(notification!);
        await preferences.setStringList("notifications", mutated.map((n) => n.stringify()).toList());
        onSucceed?.call();
        return (state.toBuilder()..notifications=ListBuilder<UserNotification>(mutated)).build();
      }
      else if (retrieve) {
        onSucceed?.call();
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
        onSucceed?.call();
        return (state.toBuilder()..notifications=ListBuilder<UserNotification>(mutated)).build();
      }
    }
    catch (_) {
      onFail?.call();
      return null;
    }
  }
}