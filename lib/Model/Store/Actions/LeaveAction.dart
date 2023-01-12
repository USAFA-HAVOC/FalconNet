import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/Leave.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

class LeaveAction extends ReduxAction<GlobalState> {
  final Leave? leave;

  LeaveAction.set(this.leave);

  LeaveAction.clear() : this.leave = null;

  @override
  GlobalState? reduce() {
    return state.modified(GlobalStateProperty.leave, leave);
  }
}