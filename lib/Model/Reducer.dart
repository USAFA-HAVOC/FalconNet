import 'package:falcon_net/Model/Cadet.dart';
import 'package:falcon_net/Model/Pass.dart';
import 'package:falcon_net/Model/GlobalState.dart';
import 'package:falcon_net/Model/UserGrades.dart';
import 'package:falcon_net/Model/UserSettings.dart';

import 'CadetDI.dart';
import 'StateAction.dart';
import 'UserNotification.dart';

GlobalState reducer(GlobalState state, dynamic act) {
  StateAction action = act as StateAction;
  switch (action.type) {

    case ActionType.editInfo: {
      //Api call to update personal info
      return state.modified(GlobalStateProperty.cadet, state.cadet.modified(action.subject!, action.value!));
    }

    case ActionType.dismiss: {
      //Local persistent storage api call to set notifications
      List<UserNotification> mutated = state.notifications;
      mutated.remove(action.value as UserNotification);
      return state.modified(GlobalStateProperty.notifications, mutated);
    }

    case ActionType.dismissAll: {
      //Local persistent storage api call to set settings
      return state.modified(GlobalStateProperty.notifications, <UserNotification>[]);
    }

    case ActionType.editSetting: {
      //Local persistent storage api call to set settings
      return state.modified(GlobalStateProperty.settings, state.settings.modified(action.subject!, action.value));
    }

    case ActionType.openPass: {
      //Api call to set current pass
      return state
          .modified(GlobalStateProperty.history, <Pass>[action.value as Pass] + state.history)
          .modified(GlobalStateProperty.pass, action.value);
    }

    case ActionType.closePass: {
      //Api call to set current pass
      return state.modified(GlobalStateProperty.pass, null);
    }

    case ActionType.updatePass: {
      //Api call to update current pass and pass history
      return state
          .modified(GlobalStateProperty.pass, action.value)
          .modified(GlobalStateProperty.history, <Pass>[action.value] + state.history.sublist(1));
    }

    case ActionType.setLeave: {
      //Api call
      return state.modified(GlobalStateProperty.leave, action.value);
    }

    case ActionType.clearLeave: {
      //Api call
      return state.modified(GlobalStateProperty.leave, null);
    }

    case ActionType.signDI: {
      //Api call
      var di = CadetDI(signature: state.cadet.name!, date: DateTime.now());
      return state.modified(GlobalStateProperty.di, di);
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