import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Database/FormOne.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

class FormAction extends ReduxAction<GlobalState> {
  final FormOne form;

  FormAction(this.form);

  @override
  GlobalState? reduce() {
    var sb = state.toBuilder();
    sb.forms.remove(form);
    sb.forms.add((form.toBuilder()..signed=true).build());
    return sb.build();
  }
}