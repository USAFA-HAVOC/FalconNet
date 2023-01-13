import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

import '../../Data/CadetDI.dart';
import '../Connection/Connection.dart' as connection;

class SignAction extends ReduxAction<GlobalState> {
  @override
  Future<GlobalState?> reduce() async {
    //var status = await connection.sign();
    await Future.delayed(Duration(milliseconds: 250));
    var status = true;
    if (status) {
      return state.modified(GlobalStateProperty.di, CadetDI(signature: state.cadet.name!, date: DateTime.now()));
    }
    else {
      print("failed to sign");
      return null;
    }
  }
}