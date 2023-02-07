import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';

import '../GlobalStateModel.dart';

class HistoryAction extends ReduxAction<GlobalState> {
  final void Function()? onFail;
  final void Function()? onSucceed;

  HistoryAction.retrieve({this.onSucceed, this.onFail});

  @override
  Future<GlobalState?> reduce() async {
    try {
      var history = await Endpoints.passHistory(null);
      var sb = state.toBuilder();
      sb.history = history.toBuilder();
      onSucceed?.call();
      return sb.build();
    }
    catch (_) {
      onFail?.call();
      return null;
    }
  }
}