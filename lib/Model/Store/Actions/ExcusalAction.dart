import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/Excusal.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../../Utility/ErrorFormatting.dart';

class ExcusalAction extends ReduxAction<GlobalState> {
  final bool create;
  final RecurringExcusal? recurring;
  final EventExcusal? excusal;

  final void Function()? onFail;
  final void Function()? onSucceed;

  ExcusalAction.createRecurring({
    required this.recurring,
    this.onFail,
    this.onSucceed
  }) :
        excusal = null,
        create = true;

  ExcusalAction.createExcusal({
    required this.excusal,
    this.onFail,
    this.onSucceed
  }) :
        recurring = null,
        create = true;

  ExcusalAction.deleteRecurring({
    required this.recurring,
    this.onFail,
    this.onSucceed
  }) :
        excusal = null,
        create = false;

  ExcusalAction.deleteExcusal({
    required this.excusal,
    this.onFail,
    this.onSucceed
  }) :
        recurring = null,
        create = false;

  @override
  Future<GlobalState?> reduce() async {
    try {
      if (create) {
        if (excusal != null) {
          var full = await Endpoints.createExcusal(excusal!);
          onSucceed?.call();
          return state
              .rebuild((s) => s.excusals.retainWhere((e) => e.event_id != full.event_id))
              .rebuild((s) => s.excusals.add(excusal!));
        }

        else if (recurring != null) {
          var full = await Endpoints.createRecurring(recurring!);
          onSucceed?.call();
          return state
              .rebuild((s) => s.recurring.retainWhere((e) => e.id != full.id))
              .rebuild((s) => s.recurring.add(recurring!));
        }
      }

      else {
        if (excusal != null) {
          await Endpoints.deleteExcusal((StringRequestBuilder()..string = excusal!.id).build());
          onSucceed?.call();
          return state
              .rebuild((s) => s.excusals.retainWhere((e) => e.id != excusal!.id));
        }

        else if (recurring != null) {
          await Endpoints.deleteRecurring((StringRequestBuilder()..string = recurring!.id).build());
          onSucceed?.call();
          return state
              .rebuild((s) => s.recurring.retainWhere((e) => e.id != recurring!.id));
        }
      }

      return null;
    }

    catch (e) {
      displayError(prefix: "Excusal", exception: e);
      onFail?.call();
      return null;
    }
  }
}