import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';
import 'package:falcon_net/Model/Database/StringRequest.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../Endpoints.dart';

class FormAction extends ReduxAction<GlobalState> {
  final FormSummary? form;
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
        var data = await Endpoints.getForms(null);
        sb.forms = data.forms.toBuilder();
      }

      else {
        await Endpoints.signForm(StringRequest((s) => s..string = form!.form_id));
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