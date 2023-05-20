import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../../../Services/NotificationService.dart';

class SignAction extends ReduxAction<GlobalState> {
  final String event;

  final void Function()? onFail;
  final void Function()? onSucceed;

  SignAction({required this.event, this.onFail, this.onSucceed});

  SignAction.di({this.onFail, this.onSucceed}) : event = "di";

  @override
  Future<GlobalState?> reduce() async {
    try {
      await Endpoints.signSelf(null);
      onSucceed?.call();
      if (event == "di" && state.settings.diPush) {
        NotificationService().scheduleDINotification();
      }

      return (state.toBuilder()
          ///TODO: Update events
      ).build();
    }
    catch (e) {
      displayError(prefix: "Signing", exception: e);
      onFail?.call();
      return null;
    }
  }
}