import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/AppStatus.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Services/NotificationService.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Database/Role.dart';
import '../../Database/TimedRole.dart';
import '../Endpoints.dart';

class GlobalAction extends ReduxAction<GlobalState> {
  final GlobalState? replacement;
  final bool init;
  final bool reset;
  final GlobalStateBuilder Function(GlobalStateBuilder)? modification;
  final void Function()? onFail;
  final void Function()? onSucceed;

  GlobalAction.set(this.replacement, {this.onFail, this.onSucceed}) : init = false, reset = false, modification = null;

  GlobalAction.modify(this.modification, {this.onFail, this.onSucceed}) : init = false, reset = false, replacement = null;

  GlobalAction.initialize({this.onFail, this.onSucceed}) : replacement = null, init = true, reset = false, modification = null;

  GlobalAction.reset({this.onFail, this.onSucceed}) : reset = true, init = false, replacement = null, modification = null;

  @override
  Future<GlobalState?> reduce() async {
    bool failed = false;

    void fail() {
      failed = true;
    }

    try {
      if (reset) {
        return state.rebuild((s) => s..status = AppStatus.loading);
      }

      else if (modification != null) {
        return modification!(state.toBuilder()).build();
      }

      else if (init) {
        var data = await Endpoints.initial(null);

        var sb = state.toBuilder();
        sb.user = data.user.toBuilder();

        if (!state.user.roles.any((r) => r.name == Roles.permanent_party.name)) {
          sb.grades = data.grades?.toBuilder();
          sb.history = data.pass_history?.toBuilder();
          sb.events = data.events?.toBuilder();
        }

        await dispatch(SettingsAction.retrieve(onFail: fail));

        if (
            !(state.user.accountability?.current_leave?.departure_time.isAfter(DateTime.now()) ?? false)
            && state.user.accountability?.current_pass == null
            && state.settings.diPush
        ) {
          NotificationService().scheduleDINotification();
        }

        if (failed) {
          onFail?.call();
          sb.status = AppStatus.failed;
          return sb.build();
        }

        sb.status = AppStatus.nominal;

        var prefs = await SharedPreferences.getInstance();
        var devPP = prefs.getBool("dev-pp") ?? false;

        if (devPP) {
          sb.user.roles.add(TimedRole((r) => r..name = Roles.permanent_party.name));
        }

        return sb.build();
      }
      else {
        onSucceed?.call();
        return replacement;
      }
    }
    catch (error) {
      onFail?.call();
      displayError(prefix: "Global Action", exception: error);
      return state.rebuild((s) => s..status = AppStatus.error);
    }
  }
}