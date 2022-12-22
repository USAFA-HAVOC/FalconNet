import 'dart:js_util';

import 'package:falcon_net/Model/UserSettings.dart';

import 'Cadet.dart';
import 'Pass.dart';
import 'UserNotification.dart';

abstract class StateObject {
  StateObject modified(String key, dynamic value);
}

class GlobalState implements StateObject {
  final Cadet cadet;
  final List<Pass> history;
  final List<UserNotification> notifications;
  final UserSettings settings;

  const GlobalState({required this.cadet, required this.history, required this.notifications, required this.settings});

  @override
  GlobalState modified(String key, value) {
    switch (key) {
      case "cadet": {
        return GlobalState(cadet: value, history: history, notifications: notifications, settings: settings);
      }
      case "history": {
        return GlobalState(cadet: cadet, history: value, notifications: notifications, settings: settings);
      }
      case "notifications": {
        return GlobalState(cadet: cadet, history: history, notifications: value, settings: settings);
      }
      case "settings": {
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: value);
      }
      default: {
        assert(false, "Does not contain key");
        return GlobalState(cadet: cadet, history: history, notifications: notifications, settings: settings);
      }
    }
  }
}