import 'package:falcon_net/Model/Cadet.dart';
import 'package:falcon_net/Model/Pass.dart';
import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/UserGrades.dart';
import 'package:falcon_net/Model/UserSettings.dart';

import 'StateAction.dart';
import 'UserNotification.dart';

GlobalState reducer(GlobalState state, dynamic act) {
  StateAction action = act as StateAction;
  switch (action.type) {

    case ActionType.editInfo: {
      //Api call
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

    case ActionType.openPass: {
      //Api call
      return state
          .modified(GlobalStateProperty.history, <Pass>[action.value as Pass] + state.history)
          .modified(GlobalStateProperty.pass, action.value);
    }

    case ActionType.closePass: {
      //Api calls
      return state.modified(GlobalStateProperty.pass, null);
    }

    case ActionType.setLeave: {
      //Api call
      print("set leave");
      return state.modified(GlobalStateProperty.leave, action.value);
    }

    case ActionType.clearLeave: {
      //Api call
      print("cleared");
      return state.modified(GlobalStateProperty.leave, null);
    }

    default: {
      return GlobalState(
          cadet: Cadet(name: "Rylie Anderson"),
          history: <Pass>[],
          notifications: <UserNotification>[],
          settings: const UserSettings(),
          grades: UserGrades(),
          leave: null,
      );
    }
  }
}