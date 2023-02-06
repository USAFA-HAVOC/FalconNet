import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class SignAction extends ReduxAction<GlobalState> {
  final void Function()? onFail;
  final void Function()? onSucceed;

  SignAction({this.onFail, this.onSucceed});

  @override
  Future<GlobalState?> reduce() async {
    try {
      await Endpoints.selfSign.hit(null);
      onSucceed?.call();
      return (state.toBuilder()..user.di.signed_by="Test"..user.di.last_signed=DateTime.now().toUtc()).build();
    }
    catch (_) {
      onFail?.call();
      return null;
    }
  }
}