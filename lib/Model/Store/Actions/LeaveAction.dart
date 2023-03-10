import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../Endpoints.dart';

class LeaveAction extends ReduxAction<GlobalState> {
  final CadetLeave? leave;
  final void Function()? onFail;
  final void Function()? onSucceed;

  LeaveAction.set(this.leave, {this.onFail, this.onSucceed});

  LeaveAction.clear({this.onFail, this.onSucceed}) : leave = null;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (leave != null) {
        await Endpoints.createLeave(leave!);
        onSucceed?.call();
        return (state.toBuilder()..user.accountability.current_leave=leave!.toBuilder()).build();
      }
      else {
        await Endpoints.clearLeave(null);
        onSucceed?.call();
        return (state.toBuilder()..user.accountability.current_leave=null).build();
      }
    }
    catch (e) {
      displayError(prefix: "Leave", exception: e);
      onFail?.call();
      return null;
    }
  }
}