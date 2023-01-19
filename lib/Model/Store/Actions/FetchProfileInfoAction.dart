import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/Cadet.dart';
import 'package:falcon_net/Model/Store/Connection/Connection.dart';
import 'package:falcon_net/Model/Store/Connection/Models.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

class FetchInitialInfoAction extends ReduxAction<GlobalState> {
  FetchInitialInfoAction();

  @override
  Future<GlobalState?> reduce() async {
    User c = await Endpoints.profile.hit(null);
    return state.modified(
      GlobalStateProperty.cadet,
      CadetModel(
        email: c.personal_info.email,
        name: c.personal_info.full_name,
        phone: c.personal_info.phone_number,
        room: c.personal_info.room_number,
        squadron: c.personal_info.squadron,
        group: c.personal_info.group,
        unit: c.personal_info.unit,
        id: c.id
      )
    );
  }
}