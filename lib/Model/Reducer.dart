import 'package:falcon_net/Model/Cadet.dart';
import 'package:falcon_net/Model/Pass.dart';
import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/UserSettings.dart';
import 'package:flutter/cupertino.dart';

import 'StateAction.dart';
import 'UserNotification.dart';

GlobalState reducer(GlobalState state, dynamic act) {
  StateAction action = act as StateAction;
  switch (action.type) {
    case ActionType.editInfo: {
      return state.modified("cadet", state.cadet.modified(action.subject! as String, action.value!));
    }
    case ActionType.dismiss: {
      List<UserNotification> mutated = state.notifications;
      mutated.remove(action.subject as UserNotification);
      return state.modified("notifications", mutated);
    }
    case ActionType.dismissAll: {
      return state.modified("notifications", <UserNotification>[]);
    }
    case ActionType.editSetting: {
      return state.modified("settings", state.settings.modified(action.subject as String, action.value));
    }
    default: {
      return GlobalState(
          cadet: Cadet(name: "Rylie Anderson"),
          history: <Pass>[],
          notifications: <UserNotification>[],
          settings: const UserSettings(
            darkTheme: false,
            pushNotifications: false,
            diPush: false,
            passPush: false,
            taskPush: false,
          )
      );
    }
  }

}