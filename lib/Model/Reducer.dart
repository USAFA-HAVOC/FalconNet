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
      //Database api call
      return state.modified(GlobalStateProperty.cadet, state.cadet.modified(action.subject!, action.value!));
    }

    case ActionType.dismiss: {
      //Local persistent storage api call
      List<UserNotification> mutated = state.notifications;
      mutated.remove(action.value as UserNotification);
      return state.modified(GlobalStateProperty.notifications, mutated);
    }

    case ActionType.dismissAll: {
      //Local persistent storage api call
      return state.modified(GlobalStateProperty.notifications, <UserNotification>[]);
    }

    case ActionType.editSetting: {
      //Local persistent storage api call
      return state.modified(GlobalStateProperty.settings, state.settings.modified(action.subject!, action.value));
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