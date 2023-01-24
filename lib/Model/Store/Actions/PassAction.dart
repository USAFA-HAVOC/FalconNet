import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class PassAction extends ReduxAction<GlobalState> {
  final CadetPass? pass;
  final bool updated;

  PassAction.open(this.pass) : updated = false;

  PassAction.update(this.pass) : updated = true;

  PassAction.close() : pass = null, updated = false;

  @override
  Future<GlobalState?> reduce() async {
    await Future.delayed(Duration(milliseconds: 10));
    if (pass == null) {
      return (state.toBuilder()..pass=null).build();
    }

    var sb = state.toBuilder();
    sb.pass = pass!.toBuilder();
    if (updated) sb.history.sublist(1);
    sb.history.insert(0, pass!);
    return sb.build();
  }
}