import 'package:async_redux/async_redux.dart';

import '../GlobalState.dart';

class InfoAction extends ReduxAction<GlobalState> {
  final GlobalState replacement;

  InfoAction(this.replacement);

  @override
  GlobalState? reduce() {
    return replacement;
  }
}