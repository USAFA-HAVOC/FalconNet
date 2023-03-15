import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/FormAction.dart';
import 'package:falcon_net/Model/Store/Actions/GradeAction.dart';
import 'package:falcon_net/Model/Store/Actions/HistoryAction.dart';
import 'package:falcon_net/Model/Store/Actions/InfoAction.dart';
import 'package:falcon_net/Model/Store/Actions/NotificationAction.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class GlobalAction extends ReduxAction<GlobalState> {
  final GlobalState? replacement;
  final bool init;
  final void Function()? onFail;
  final void Function()? onSucceed;

  GlobalAction.set(this.replacement, {this.onFail, this.onSucceed}) : init = false;

  GlobalAction.initialize({this.onFail, this.onSucceed}) : replacement = null, init = true;

  @override
  Future<GlobalState?> reduce() async {
    bool failed = false;

    void fail() {
      failed = true;
    }

    try {
      if (init) {

        /*
        List<FutureOr> futures = [];

        futures.add(dispatch(InfoAction.retrieve(onFail: fail)));
        futures.add(dispatch(GradeAction.retrieve(onFail: fail)));
        futures.add(dispatch(SettingsAction.retrieve(onFail: fail)));
        //futures.add(dispatch(FormAction.retrieve(onFail: fail)));
        futures.add(dispatch(HistoryAction.retrieve(onFail: fail)));
        futures.add(dispatch(NotificationAction.retrieve(onFail: fail)));

        //Poor man's Promise.all()
        for (var future in futures) {
          await future;
        }
         */


        await dispatch(InfoAction.retrieve(onFail: fail));
        await dispatch(GradeAction.retrieve(onFail: fail));
        await dispatch(SettingsAction.retrieve(onFail: fail));
        await dispatch(HistoryAction.retrieve(onFail: fail));
        await dispatch(NotificationAction.retrieve(onFail: fail));
        await dispatch(FormAction.retrieve(onFail: () => {
          //print("Forms endpoint not implemented")
        }));

        if (failed) {
          onFail?.call();
          return null;
        }

        onSucceed?.call();
        return null;
      }
      else {
        onSucceed?.call();
        return replacement;
      }
    }
    catch (_) {
      return null;
    }
  }
}