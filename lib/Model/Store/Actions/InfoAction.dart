import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Store/Actions/FetchProfileInfoAction.dart';
import 'package:falcon_net/Model/Store/Connection/Connection.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class InfoAction extends ReduxAction<GlobalState> {
  final UserBuilder Function(UserBuilder c) modify;
  
  InfoAction({required this.modify});

  @override
  Future<GlobalState?> reduce() async {
    UserBuilder newUser = modify(state.user.toBuilder());
    Endpoints.profileEdit.hit(newUser.build()).then((value) {
      store.dispatch(FetchProfileInfoAction());
    });
    return (state.toBuilder()..user=newUser).build();
  }
}