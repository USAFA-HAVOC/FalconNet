import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class LeaveAction extends ReduxAction<GlobalState> {
  final CadetLeave? leave;

  LeaveAction.set(this.leave);

  LeaveAction.clear() : leave = null;

  @override
  GlobalState? reduce() {
    return (state.toBuilder()..leave=leave?.toBuilder()).build();
  }
}