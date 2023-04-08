import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/FormAction.dart';
import 'package:falcon_net/Model/Store/Actions/GradeAction.dart';
import 'package:falcon_net/Model/Store/Actions/HistoryAction.dart';
import 'package:falcon_net/Model/Store/Actions/InfoAction.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/AppStatus.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Services/NotificationService.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';

import '../../Database/Roles.dart';

class GlobalAction extends ReduxAction<GlobalState> {
  final GlobalState? replacement;
  final bool init;
  final bool reset;
  final void Function()? onFail;
  final void Function()? onSucceed;

  GlobalAction.set(this.replacement, {this.onFail, this.onSucceed}) : init = false, reset = false;

  GlobalAction.initialize({this.onFail, this.onSucceed}) : replacement = null, init = true, reset = false;

  GlobalAction.reset({this.onFail, this.onSucceed}) : reset = true, init = false, replacement = null;

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

      if (init) {
        await dispatch(InfoAction.retrieve(onFail: fail));

        if (!state.user.roles.any((r) => r.role == Roles.permanent_party.name)) {
          await dispatch(GradeAction.retrieve(onFail: fail));
          await dispatch(HistoryAction.retrieve(onFail: fail));
          await dispatch(FormAction.retrieve(onFail: fail));
        }

        await dispatch(SettingsAction.retrieve(onFail: fail));

        if (
            !(state.leave?.departure_time.isAfter(DateTime.now()) ?? false)
            && state.pass == null
            && state.settings.diPush
        ) {
          NotificationService().scheduleDINotification();
        }

        if (failed) {
          onFail?.call();
          return state.rebuild((s) => s..status = AppStatus.failed);
        }

        return state.rebuild((s) => s..status = AppStatus.nominal);
      }
      else {
        onSucceed?.call();
        return replacement;
      }
    }
    catch (error) {
      displayError(prefix: "Global Action", exception: error);
      return state.rebuild((s) => s..status = AppStatus.error);
    }
  }
}