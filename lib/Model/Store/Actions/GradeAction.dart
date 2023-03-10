import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';

import '../../../Utility/ErrorFormatting.dart';
import '../GlobalStateModel.dart';

class GradeAction extends ReduxAction<GlobalState> {
  final void Function()? onFail;
  final void Function()? onSucceed;

  GradeAction.retrieve({this.onSucceed, this.onFail});

  @override
  Future<GlobalState?> reduce() async {
    try {
      var grades = await Endpoints.getGrades(null);
      print(grades);
      var sb = state.toBuilder();
      sb.grades = grades.toBuilder();
      onSucceed?.call();
      return sb.build();
    }
    catch (e) {
      displayError(prefix: "Grade", exception: e);
      onFail?.call();
      return null;
    }
  }
}