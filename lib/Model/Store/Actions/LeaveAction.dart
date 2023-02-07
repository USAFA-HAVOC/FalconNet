import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import '../Endpoints.dart';

class LeaveAction extends ReduxAction<GlobalState> {
  final CadetLeave? leave;
  final bool retrieve;
  final void Function()? onFail;
  final void Function()? onSucceed;

  LeaveAction.set(this.leave, {this.onFail, this.onSucceed}) : retrieve = false;

  LeaveAction.clear({this.onFail, this.onSucceed}) : leave = null, retrieve = false;

  LeaveAction.retrieve({this.onFail, this.onSucceed}) : leave = null, retrieve = true;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (retrieve) {
        var leave = await Endpoints.leaveGet(null);
        onSucceed?.call();
        return (state.toBuilder()..leave=leave.toBuilder()).build();
      }
      if (leave != null) {
        await Endpoints.leaveSet(leave!);
        onSucceed?.call();
        return (state.toBuilder()..leave=leave?.toBuilder()).build();
      }
      else {
        await Endpoints.leaveClear(null);
        onSucceed?.call();
        return (state.toBuilder()..leave=null).build();
      }
    }
    catch (e) {
      print(e.toString());
      onFail?.call();
      return null;
    }
  }
}