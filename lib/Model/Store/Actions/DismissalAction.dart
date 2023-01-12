import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../Data/UserNotification.dart';

class DismissalAction extends ReduxAction<GlobalState> {
  final UserNotification? notification;
  final bool all;

  DismissalAction(this.notification): all = false;

  DismissalAction.all() : all = true, notification = null;

  @override
  GlobalState? reduce() {
    //local storage api call
    if (!all) {
      List<UserNotification> mutated = state.notifications;
      mutated.remove(notification);
      return state.modified(GlobalStateProperty.notifications, mutated);
    }
    else {
      return state.modified(GlobalStateProperty.notifications, <UserNotification>[]);
    }
  }
}