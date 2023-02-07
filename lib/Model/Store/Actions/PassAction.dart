import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class PassAction extends ReduxAction<GlobalState> {
  final CadetPass? pass;
  final bool updated;
  final bool retrieve;
  final void Function()? onFail;
  final void Function()? onSucceed;

  PassAction.open(this.pass, {this.onFail, this.onSucceed}) : updated = false, retrieve = false;

  PassAction.update(this.pass, {this.onFail, this.onSucceed}) : updated = true, retrieve = false;

  PassAction.close({this.onFail, this.onSucceed}) : pass = null, updated = false, retrieve = false;

  PassAction.retrieve({this.onFail, this.onSucceed}) : pass = null, updated = false, retrieve = true;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (retrieve) {
        var pass = await Endpoints.passGet(null);
        onSucceed?.call();
        return (state.toBuilder()..pass=pass.toBuilder()).build();
      }
      if (pass == null) {
        await Endpoints.passClose(null);
        onSucceed?.call();
        return (state.toBuilder()..pass=null).build();
      }

      await Endpoints.passSet(pass!);

      var sb = state.toBuilder();
      sb.pass = pass!.toBuilder();
      if (updated) sb.history.sublist(1);
      sb.history.insert(0, pass!);
      onSucceed?.call();
      return sb.build();
    }
    catch (_) {
      onFail?.call();
      return null;
    }
  }
}