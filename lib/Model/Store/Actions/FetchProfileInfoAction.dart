import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Connection/Connection.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import '../../Database/User.dart';

class FetchProfileInfoAction extends ReduxAction<GlobalState> {
  FetchProfileInfoAction();

  @override
  Future<GlobalState?> reduce() async {
    User c = await Endpoints.profile.hit(null);
    return (state.toBuilder()..user=c.toBuilder()).build();
  }
}