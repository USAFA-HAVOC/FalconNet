import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
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
  final GlobalStateBuilder Function(GlobalStateBuilder)? modification;
  final void Function()? onFail;
  final void Function()? onSucceed;

  GlobalAction.set(this.replacement, {this.onFail, this.onSucceed}) : init = false, modification = null;

  GlobalAction.modify(this.modification, {this.onFail, this.onSucceed}) : init = false, replacement = null;

  GlobalAction.initialize({this.onFail, this.onSucceed}) : replacement = null, init = true, modification = null;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (modification != null) {
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

        var unset = false;

        await dispatch(SettingsAction.retrieve(onFail: () => unset = true));

        if (
            !(state.user.accountability?.current_leave?.departure_time.isAfter(DateTime.now()) ?? false)
            && state.user.accountability?.current_pass == null
            && state.settings.diPush
        ) {
          NotificationService().scheduleDINotification();
        }

        if (unset) {
          onFail?.call();
          sb.status = AppStatus.error;
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

      if (error is DioError) {
        if (
            [
              DioErrorType.other,
              DioErrorType.connectTimeout,
              DioErrorType.receiveTimeout,
              DioErrorType.sendTimeout
            ].contains(error.type)
        ) {
          return state.rebuild((s) => s..status = AppStatus.failed);
        }
      }

      return state.rebuild((s) => s..status = AppStatus.error);
    }
  }
}