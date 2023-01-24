import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class SetAction extends ReduxAction<GlobalState> {
  final GlobalState replacement;

  SetAction(this.replacement);

  @override
  GlobalState? reduce() {
    return replacement;
  }
}