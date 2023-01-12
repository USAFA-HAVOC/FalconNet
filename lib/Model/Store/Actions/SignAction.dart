import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../Data/CadetDI.dart';

class SignAction extends ReduxAction<GlobalState> {
  GlobalState? reduce() {
    return state.modified(GlobalStateProperty.di, CadetDI(signature: state.cadet.name!, date: DateTime.now()));
  }
}