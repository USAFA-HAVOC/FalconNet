import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Services/NotificationService.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../Endpoints.dart';

class LeaveAction extends ReduxAction<GlobalState> {
  final CadetLeave? leave;
  final void Function()? onFail;
  final void Function()? onSucceed;

  LeaveAction.set(this.leave, {this.onFail, this.onSucceed});

  LeaveAction.clear({this.onFail, this.onSucceed}) : leave = null;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (leave != null) {
        var assigned = await Endpoints.createLeave(leave!);
        onSucceed?.call();
        NotificationService().cancelDINotification();
        if (state.user.accountability?.current_leave?.id != null) {
          NotificationService().cancel(id: state.user.accountability!.current_leave!.id!);
        }
        if (state.settings.pushNotifications) {
          NotificationService().schedule(
              title: "Leave Locator Expired",
              body: "Please either update or clear your leave locator",
              time: assigned.return_time,
              id: assigned.id
          );
        }
        return (state.toBuilder()..user.accountability.current_leave=assigned.toBuilder()).build();
      }
      else {
        await Endpoints.clearLeave(null);
        onSucceed?.call();
        if (state.settings.diPush) {
          NotificationService().scheduleDINotification();
        }
        if (state.user.accountability?.current_leave?.id != null) {
          NotificationService().cancel(id: state.user.accountability!.current_leave!.id!);
        }
        return (state.toBuilder()..user.accountability.current_leave=null).build();
      }
    }
    catch (e) {
      displayError(prefix: "Leave", exception: e);
      onFail?.call();
      return null;
    }
  }
}