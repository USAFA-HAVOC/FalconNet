import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/SignRequest.dart';
import 'package:falcon_net/Model/Database/UserEvent.dart';
import 'package:falcon_net/Model/Database/UserStatus.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../../../Services/NotificationService.dart';

class SignAction extends ReduxAction<GlobalState> {
  final String? event;

  final void Function()? onFail;
  final void Function()? onSucceed;

  SignAction({required this.event, this.onFail, this.onSucceed});

  @override
  Future<GlobalState?> reduce() async {
    try {
      await Endpoints.signEvent(SignRequest((s) => s
          ..user_id = null
          ..event_id = event
      ));
      onSucceed?.call();
      if (event == null && state.settings.diPush) {
        NotificationService().scheduleDINotification();
      }

      return (state.toBuilder()
          ..events = <UserEvent>[
            ...state.events.where((e) => e.event_id != event),
            state.events.firstWhere((e) => e.event_id == event)
                .rebuild((e) => e
                  ..status = UserStatus.signed.name
                  ..signature_name = state.user.personal_info.full_name
                  ..signature_user_id = state.user.id
                  ..signature_time = DateTime.now().toUtc()
                )
          ].build().toBuilder()
      ).build();
    }

    catch (e) {
      displayError(prefix: "Signing", exception: e);
      onFail?.call();
      return null;
    }
  }
}