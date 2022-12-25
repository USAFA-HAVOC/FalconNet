import 'package:falcon_net/Model/Data/Cadet.dart';
import 'package:falcon_net/Model/Data/Pass.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Model/Data/PassAllocation.dart';
import 'package:falcon_net/Model/Data/UserGrades.dart';
import 'package:falcon_net/Model/Data/UserSettings.dart';

import '../Data/CadetDI.dart';
import '../Data/UserNotification.dart';
import 'StateAction.dart';

///Handles all actions dispatched against the model
///Returns new state based on action and old state
GlobalState reducer(GlobalState state, dynamic act) {
  StateAction action = act as StateAction;
  switch (action.type) {

    //Edits cadet personal info
    case ActionType.editInfo: {
      //Api call to update personal info
      return state.modified(GlobalStateProperty.cadet, state.cadet.modified(action.subject!, action.value!));
    }

    //Dismiss a specific notification
    case ActionType.dismiss: {
      //Local persistent storage api call to set notifications
      List<UserNotification> mutated = state.notifications;
      mutated.remove(action.value as UserNotification);
      return state.modified(GlobalStateProperty.notifications, mutated);
    }

    //Dismiss all notifications
    case ActionType.dismissAll: {
      //Local persistent storage api call to set settings
      return state.modified(GlobalStateProperty.notifications, <UserNotification>[]);
    }

    //Edits a specific settings
    case ActionType.editSetting: {
      //Local persistent storage api call to set settings
      return state.modified(GlobalStateProperty.settings, state.settings.modified(action.subject!, action.value));
    }

    //Opens a new pass and adds to history
    case ActionType.openPass: {
      //Api call to set current pass
      return state
          .modified(GlobalStateProperty.history, <Pass>[action.value as Pass] + state.history)
          .modified(GlobalStateProperty.pass, action.value);
    }

    //Closes active pass
    case ActionType.closePass: {
      //Api call to set current pass
      return state.modified(GlobalStateProperty.pass, null);
    }

    //Edits active pass and history
    case ActionType.updatePass: {
      //Api call to update current pass and pass history
      return state
          .modified(GlobalStateProperty.pass, action.value)
          .modified(GlobalStateProperty.history, <Pass>[action.value] + state.history.sublist(1));
    }

    //Sets leave data
    case ActionType.setLeave: {
      //Api call
      return state.modified(GlobalStateProperty.leave, action.value);
    }

    //Clears leave data
    case ActionType.clearLeave: {
      //Api call
      return state.modified(GlobalStateProperty.leave, null);
    }

    //Self-signs DI
    case ActionType.signDI: {
      //Api call
      var di = CadetDI(signature: state.cadet.name!, date: DateTime.now());
      return state.modified(GlobalStateProperty.di, di);
    }

    //Default option is required, so return dummy data
    default: {
      throw const NoSuchProperty();
    }
  }
}