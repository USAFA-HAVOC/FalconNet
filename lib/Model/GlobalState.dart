import 'dart:js_util';

import 'package:falcon_net/Model/PassAllocation.dart';
import 'package:falcon_net/Model/UserGrades.dart';
import 'package:falcon_net/Model/UserSettings.dart';
import 'package:flutter/foundation.dart';

import 'Cadet.dart';
import 'CadetDI.dart';
import 'Leave.dart';
import 'Pass.dart';
import 'UserNotification.dart';

abstract class StateObject {
  StateObject modified(Enum key, dynamic value);
}

class GlobalState implements StateObject {
  final Cadet cadet;
  final List<Pass> history;
  final List<UserNotification> notifications;
  final UserSettings settings;
  final UserGrades grades;
  final PassAllocation allocation;
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
    this.leave,
    this.pass,
    this.di,
  });

  @override
  GlobalState modified(Enum k, value) {
    GlobalStateProperty key = k as GlobalStateProperty;
    switch (key) {
      case GlobalStateProperty.cadet: {
        return GlobalState(cadet: value, history: history, notifications: notifications, settings: settings, grades: grades, leave: leave, pass: pass, di: di, allocation: allocation);
      }
      case GlobalStateProperty.history: {
        return GlobalState(cadet: cadet, history: value, notifications: notifications, settings: settings, grades: grades, leave: leave, pass: pass, di: di, allocation: allocation);
      }
      case GlobalStateProperty.notifications: {
        return GlobalState(cadet: cadet, history: history, notifications: value, settings: settings, grades: grades, leave: leave, pass: pass, di: di, allocation: allocation);
      }
      case GlobalStateProperty.settings: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: value, grades: grades, leave: leave, pass: pass, di: di, allocation: allocation);
      }
      case GlobalStateProperty.grades: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings, grades: value, leave: leave, pass: pass, di: di, allocation: allocation);
      }
      case GlobalStateProperty.leave: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings, grades: grades, leave: value, pass: pass, di: di, allocation: allocation);
      }
      case GlobalStateProperty.pass: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings, grades: grades, leave: leave, pass: value, di: di, allocation: allocation);
      }
      case GlobalStateProperty.di: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings, grades: grades, leave: leave, pass: pass, di: value, allocation: allocation);
      }
      case GlobalStateProperty.allocation: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings, grades: grades, leave: leave, pass: pass, di: di, allocation: value);
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
}