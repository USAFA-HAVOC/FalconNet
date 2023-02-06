import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Actions/GradeAction.dart';
import 'package:falcon_net/Model/Store/Actions/HistoryAction.dart';
import 'package:falcon_net/Model/Store/Actions/InfoAction.dart';
import 'package:falcon_net/Model/Store/Actions/LeaveAction.dart';
import 'package:falcon_net/Model/Store/Actions/SettingsAction.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import 'FormAction.dart';
import 'PassAction.dart';

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
      print("failed");
    }

    try {
      if (init) {

        List<FutureOr> futures = [];

        futures.add(dispatch(InfoAction.retrieve(onFail: fail)));
        futures.add(dispatch(GradeAction.retrieve(onFail: fail)));
        futures.add(dispatch(SettingsAction.retrieve(onFail: fail)));
        futures.add(dispatch(PassAction.retrieve(onFail: fail)));
        futures.add(dispatch(LeaveAction.retrieve(onFail: fail)));
        futures.add(dispatch(FormAction.retrieve(onFail: fail)));
        futures.add(dispatch(HistoryAction.retrieve(onFail: fail)));

        //Poor man's Promise.all()
        for (var future in futures) {
          await future;
        }

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