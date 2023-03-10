import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import '../../../Utility/ErrorFormatting.dart';

class PassAction extends ReduxAction<GlobalState> {
  final CadetPass? pass;
  final bool updated;
  final void Function()? onFail;
  final void Function()? onSucceed;

  PassAction.open(this.pass, {this.onFail, this.onSucceed}) : updated = false;

  PassAction.update(this.pass, {this.onFail, this.onSucceed}) : updated = true;

  PassAction.close({this.onFail, this.onSucceed}) : pass = null, updated = false;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (pass == null) {
        await Endpoints.closePass(null);
        onSucceed?.call();
        return (state.toBuilder()..user.accountability.current_pass=null).build();
      }

      print(pass!);

      var sb = state.toBuilder();

      if (updated) {
        await Endpoints.updatePass(pass!);
        sb.user.accountability.current_pass = pass!.toBuilder();
      }

      else {
        var assigned = await Endpoints.createPass(pass!);
        sb.user.accountability.current_pass = assigned.toBuilder();
      }

      onSucceed?.call();
      return sb.build();
    }

    catch (e) {
      displayError(prefix: "Pass", exception: e);
      onFail?.call();
      return null;
    }
  }
}