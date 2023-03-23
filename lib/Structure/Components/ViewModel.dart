import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

class ViewModel<T> {
  final FutureOr<ActionStatus> Function(ReduxAction<GlobalState>) dispatch;
  final T content;

  ViewModel({required Store<GlobalState> store, required this.content}) :
      dispatch = store.dispatch;
}