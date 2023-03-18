import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/SchedulingEvent.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Services/NotificationService.dart';
import 'package:falcon_net/Services/SchedulingService.dart';

import '../../../Utility/ErrorFormatting.dart';

class PassAction extends ReduxAction<GlobalState> {
  final CadetPass? pass;
  final bool updated;
  final void Function()? onFail;
  final void Function()? onSucceed;

  PassAction.open(this.pass, {this.onFail, this.onSucceed}) : updated = false;

  PassAction.update(this.pass, {this.onFail, this.onSucceed}) : updated = true;

  PassAction.close({this.onFail, this.onSucceed}) : pass = null, updated = false;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (pass == null) {
        await Endpoints.closePass(null);
        onSucceed?.call();
        NotificationService().cancel(id: state.user.accountability!.current_pass!.id!);
        if (state.settings.diPush) {
          NotificationService().scheduleDINotification();
        }
        return (state.toBuilder()..user.accountability.current_pass=null).build();
      }

      var sb = state.toBuilder();

      if (updated) {
        await Endpoints.updatePass(pass!);
        SchedulingService().schedule(id: "pass", time: pass!.end_time, payload: "expired");
        NotificationService().cancel(id: state.user.accountability!.current_pass!.id!);
        if (state.settings.passPush) {
          NotificationService().schedule(
              title: "Pass Expired",
              body: "Your pass has expired, please either close or update it",
              time: pass!.end_time,
              id: pass!.id
          );
        }
        sb.user.accountability.current_pass = pass!.toBuilder();
      }

      else {
        var assigned = await Endpoints.createPass(pass!);
        SchedulingService().schedule(id: "pass", time: assigned.end_time, payload: "expired");
        NotificationService().cancelDINotification();
        if (state.settings.passPush) {
          NotificationService().schedule(
              title: "Pass Expired",
              body: "Your pass has expired, please either close or update it",
              time: assigned.end_time,
              id: assigned.id
          );
        }
        sb.user.accountability.current_pass = assigned.toBuilder();
      }

      onSucceed?.call();
      return sb.build();
    }

    catch (e) {
      displayError(prefix: "Pass", exception: e);
      onFail?.call();
      return null;
    }
  }
}