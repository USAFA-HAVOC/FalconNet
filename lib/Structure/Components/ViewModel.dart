import 'package:async_redux/async_redux.dart';

import '../../Model/Store/GlobalState.dart';

class ViewModel<T> {
  final void Function(ReduxAction<GlobalState>) dispatch;
  final T content;

  ViewModel({required Store<GlobalState> store, required this.content}) :
      dispatch = ((action) => store.dispatch(action));
}