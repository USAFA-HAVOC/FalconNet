import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Serializers.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utility/ErrorFormatting.dart';

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

      List<UserNotification> existing = (preferences.getStringList("notifications") ?? [])
          .map((notification) => serializers.fromJson(UserNotification.serializer, notification))
          .where((notification) => notification != null)
          .map((notification) => notification!).toList();

      if (all) {
        await preferences.setStringList("notifications", <String>[]);
        return (state.toBuilder()..notifications.clear()).build();
      }

      else if (add) {
        List<UserNotification> mutated = existing + [notification!];
        var serialized = mutated
            .map((notification) => serializers.toJson(UserNotification.serializer, notification))
            .toList();
        await preferences.setStringList("notifications", serialized);
        onSucceed?.call();
        return (state.toBuilder()..notifications=ListBuilder<UserNotification>(mutated)).build();
      }

      else if (retrieve) {
        var sb = state.toBuilder();
        sb.notifications=ListBuilder<UserNotification>(existing);
        onSucceed?.call();
        return sb.build();
      }

      else {
        List<UserNotification> mutated = state.notifications.toList(growable: false).where((n) => n != notification!).toList();
        var serialized = mutated
            .map((notification) => serializers.toJson(UserNotification.serializer, notification))
            .toList();
        await preferences.setStringList("notifications", serialized);
        onSucceed?.call();
        return (state.toBuilder()..notifications=ListBuilder<UserNotification>(mutated)).build();
      }
    }
    catch (e) {
      displayError(prefix: "Notification", exception: e);
      onFail?.call();
      return null;
    }
  }
}