import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/FormOne.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

class FormAction extends ReduxAction<GlobalState> {
  final FormOne form;

  FormAction(this.form);

  @override
  GlobalState? reduce() {
    var list = state.forms;
    list.remove(form);
    list.add((form).sign());
    return state.modified(GlobalStateProperty.forms, list);
  }
}