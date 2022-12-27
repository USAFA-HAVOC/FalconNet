import 'package:falcon_net/Model/Data/PassAllocation.dart';
import 'package:falcon_net/Model/Data/UserGrades.dart';
import 'package:falcon_net/Model/Data/UserSettings.dart';

import '../Data/Cadet.dart';
import '../Data/CadetDI.dart';
import '../Data/FormOne.dart';
import '../Data/Leave.dart';
import '../Data/Pass.dart';
import '../Data/UserNotification.dart';

///Required for modifiable state objects
///Enum will be an enum of property types for each subclass
///Value is dynamic and must match property type
abstract class StateObject {
  StateObject modified(Enum key, dynamic value);
}

class NoSuchProperty implements Exception {
  final String? cause;

  const NoSuchProperty({this.cause});
}

///Global application state both for api and local data
///Modified by dispatching actions to reducer
class GlobalState implements StateObject {
  final Cadet cadet;
  final List<Pass> history;
  final List<UserNotification> notifications;
  final UserSettings settings;
  final UserGrades grades;
  final PassAllocation allocation;
  final List<FormOne> forms;
  final Leave? leave;
  final Pass? pass;
  final CadetDI? di;

  const GlobalState({
    required this.cadet,
    required this.history,
    required this.notifications,
    required this.settings,
    required this.grades,
    required this.allocation,
    required this.forms,
    this.leave,
    this.pass,
    this.di,
  });

  @override
  GlobalState modified(Enum k, value) {
    GlobalStateProperty key = k as GlobalStateProperty;
    switch (key) {
      case GlobalStateProperty.cadet: {
        return GlobalState(cadet: value, history: history, notifications: notifications, settings: settings,
            grades: grades, leave: leave, pass: pass, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.history: {
        return GlobalState(cadet: cadet, history: value, notifications: notifications, settings: settings,
            grades: grades, leave: leave, pass: pass, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.notifications: {
        return GlobalState(cadet: cadet, history: history, notifications: value, settings: settings,
            grades: grades, leave: leave, pass: pass, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.settings: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: value,
            grades: grades, leave: leave, pass: pass, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.grades: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings,
            grades: value, leave: leave, pass: pass, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.leave: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings,
            grades: grades, leave: value, pass: pass, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.pass: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings,
            grades: grades, leave: leave, pass: value, di: di, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.di: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings,
            grades: grades, leave: leave, pass: pass, di: value, allocation: allocation, forms: forms);
      }
      case GlobalStateProperty.allocation: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings,
            grades: grades, leave: leave, pass: pass, di: di, allocation: value, forms: forms);
      }
      case GlobalStateProperty.forms: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings,
            grades: grades, leave: leave, pass: pass, di: di, allocation: allocation, forms: value);
      }
    }
  }
}

enum GlobalStateProperty {
  cadet,
  history,
  notifications,
  settings,
  grades,
  leave,
  pass,
  di,
  allocation,
  forms,
}