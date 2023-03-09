import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Database/Forms.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';
import 'package:falcon_net/Utility/ErrorFormatting.dart';

import '../Endpoints.dart';

class FormAction extends ReduxAction<GlobalState> {
  final FormOne? form;
  final bool retrieve;
  final void Function()? onFail;
  final void Function()? onSucceed;

  FormAction(this.form, {this.onSucceed, this.onFail}) : retrieve = false;

  FormAction.retrieve({this.onSucceed, this.onFail}) : form = null, retrieve = true;

  @override
  Future<GlobalState?> reduce() async {
    try {
      var sb = state.toBuilder();
      if (retrieve) {
        var forms = await Endpoints.formsGet(null);
        sb.forms = forms.toBuilder();
      }
      else {
        sb.forms.remove(form);
        sb.forms.add((form!.toBuilder()..signed=true).build());
      }
      onSucceed?.call();
      return sb.build();
    }

    catch (e) {
      displayError(prefix: "Form", exception: e);
      onFail?.call();
      return null;
    }
  }
}