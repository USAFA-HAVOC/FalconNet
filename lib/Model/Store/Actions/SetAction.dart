import 'package:async_redux/async_redux.dart';

import '../GlobalState.dart';

class SetAction extends ReduxAction<GlobalState> {
  final GlobalState replacement;

  SetAction(this.replacement);

  @override
  GlobalState? reduce() {
    return replacement;
  }
}