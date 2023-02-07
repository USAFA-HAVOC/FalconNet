import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class InfoAction extends ReduxAction<GlobalState> {
  final UserBuilder Function(UserBuilder c)? modify;
  final bool retrieval;
  final void Function()? onFail;
  final void Function()? onSucceed;
  
  InfoAction({required this.modify, this.onFail, this.onSucceed}) : retrieval = false;

  InfoAction.retrieve({this.onFail, this.onSucceed}) : retrieval = true, modify = null;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (retrieval) {
        User c = await Endpoints.profileGet.hit(null);
        print(c);
        onSucceed?.call();
        return (state.toBuilder()..user=c.toBuilder()).build();
      }
      else {
        UserBuilder newUser = modify!(state.user.toBuilder());
        await Endpoints.profileEdit.hit(newUser.build());
        onSucceed?.call();
        return (state.toBuilder()..user=newUser).build();
      }
    }
    catch (e) {
      onFail?.call();
      return null;
    }
  }
}