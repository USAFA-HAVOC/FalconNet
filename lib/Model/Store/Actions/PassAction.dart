import 'package:async_redux/async_redux.dart';

import '../../Data/Pass.dart';
import '../GlobalState.dart';

class PassAction extends ReduxAction<GlobalState> {
  final Pass? pass;
  final bool updated;

  PassAction.open(this.pass) : updated = false;

  PassAction.update(this.pass) : updated = true;

  PassAction.close() : pass = null, updated = false;

  @override
  Future<GlobalState?> reduce() async {
    await Future.delayed(Duration(milliseconds: 10));
    if (pass == null) {
      return state.modified(GlobalStateProperty.pass, null);
    }

    else if (updated) {
      return state
          .modified(GlobalStateProperty.pass, pass)
          .modified(GlobalStateProperty.history, <Pass>[pass!] + state.history.sublist(1));
    }

    return state
        .modified(GlobalStateProperty.history, <Pass>[pass!] + state.history)
        .modified(GlobalStateProperty.pass, pass!);
  }
}