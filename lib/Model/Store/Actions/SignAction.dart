import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import '../../../Utility/ErrorFormatting.dart';

class SignAction extends ReduxAction<GlobalState> {
  final void Function()? onFail;
  final void Function()? onSucceed;

  SignAction({this.onFail, this.onSucceed});

  @override
  Future<GlobalState?> reduce() async {
    try {
      await Endpoints.selfSign(null);
      onSucceed?.call();
      return (state.toBuilder()
        ..user.accountability.di_signed_by=state.user.id
        ..user.accountability.di_last_signed=DateTime.now().toUtc()
      ).build();
    }
    catch (e) {
      displayError(prefix: "Form", exception: e);
      onFail?.call();
      return null;
    }
  }
}