import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class SignAction extends ReduxAction<GlobalState> {
  @override
  Future<GlobalState?> reduce() async {
    await Future.delayed(const Duration(milliseconds: 250));
    var status = true;
    if (status) {
      return (state.toBuilder()..user.di.signed_by="Test"..user.di.last_signed=DateTime.now().toUtc()).build();
    }
    else {
      print("failed to sign");
      return null;
    }
  }
}