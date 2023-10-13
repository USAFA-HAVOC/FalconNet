import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';
import 'package:falcon_net/Services/NotificationService.dart';
import 'package:falcon_net/Services/SchedulingService.dart';
import 'package:falcon_net/Utility/ListExtensions.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../../Database/AccountabilityEvent.dart';

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
      var di = state.events
          .where((e) => e.type == EventType.di.name && e.submission_deadline.add(const Duration(hours: 8)).isAfter(DateTime.now()))
          .toList()
          .sortedKey((e) => e.submission_deadline)
          .firstOrNull?.event_id;
      //print(di);
      if (pass == null) {
        await Endpoints.closePass(null);

        // Bruh moment
        var sb = state.toBuilder();

        var data = await Endpoints.initial(null);
        sb.user = data.user.toBuilder();
        sb.events = data.events?.toBuilder();

        onSucceed?.call();
        
        if (state.user.accountability?.current_pass?.id !=  null) {
          NotificationService().cancel(id: state.user.accountability!.current_pass!.id!);
        }

        if (state.settings.diPush) {
          NotificationService().scheduleDINotification();
        }

        return (sb..user.accountability.current_pass=null).build();
      }

      var sb = state.toBuilder();

      if (updated) {
        await Endpoints.updatePass(pass!);

        // Bruh moment
        var data = await Endpoints.initial(null);
        sb.user = data.user.toBuilder();
        sb.events = data.events?.toBuilder();

        SchedulingService().schedule(id: "pass", time: pass!.end_time, payload: "expired");
        NotificationService().cancel(id: state.user.accountability!.current_pass!.id!);
        if (state.settings.passPush) {
          NotificationService().schedule(
              title: "Pass Expired",
              body: "Your pass has expired, please either close or update it",
              time: pass!.end_time,
              id: pass!.id,
              payload: "/pass_management"
          );
        }
        sb.user.accountability.current_pass = pass!.toBuilder();
      }

      else {
        var assigned = await Endpoints.createPass(pass!);

        // Bruh moment
        var data = await Endpoints.initial(null);
        sb.user = data.user.toBuilder();
        sb.events = data.events?.toBuilder();

        SchedulingService().schedule(id: "pass", time: assigned.end_time, payload: "expired");
        NotificationService().cancelDINotification();
        if (state.settings.passPush) {
          NotificationService().schedule(
              title: "Pass Expired",
              body: "Your pass has expired, please either close or update it",
              time: assigned.end_time,
              id: assigned.id,
              payload: "/pass_management"
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