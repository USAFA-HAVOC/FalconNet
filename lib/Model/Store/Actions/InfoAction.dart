import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Store/Connection/Connection.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class InfoAction extends ReduxAction<GlobalState> {
  final UserBuilder Function(UserBuilder c)? modify;
  final bool retrieval;
  
  InfoAction({required this.modify}) : retrieval = false;

  InfoAction.retrieve() : retrieval = true, modify = null;

  @override
  Future<GlobalState?> reduce() async {
    if (retrieval) {
      User c = await Endpoints.profile.hit(null);
      return (state.toBuilder()..user=c.toBuilder()).build();
    }
    else {
      UserBuilder newUser = modify!(state.user.toBuilder());
      Endpoints.profileEdit.hit(newUser.build()).then((value) {
        store.dispatch(InfoAction.retrieve());
      });
      return (state.toBuilder()..user=newUser).build();
    }
  }
}