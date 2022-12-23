import 'dart:js_util';

import 'package:falcon_net/Model/UserSettings.dart';
import 'package:flutter/foundation.dart';

import 'Cadet.dart';
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

  const GlobalState({required this.cadet, required this.history, required this.notifications, required this.settings});

  @override
  GlobalState modified(Enum k, value) {
    GlobalStateProperty key = k as GlobalStateProperty;
    switch (key) {
      case GlobalStateProperty.cadet: {
        return GlobalState(cadet: value, history: history, notifications: notifications, settings: settings);
      }
      case GlobalStateProperty.history: {
        return GlobalState(cadet: cadet, history: value, notifications: notifications, settings: settings);
      }
      case GlobalStateProperty.notifications: {
        return GlobalState(cadet: cadet, history: history, notifications: value, settings: settings);
      }
      case GlobalStateProperty.settings: {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: value);
      }
    }
  }
}

enum GlobalStateProperty {
  cadet,
  history,
  notifications,
  settings
}