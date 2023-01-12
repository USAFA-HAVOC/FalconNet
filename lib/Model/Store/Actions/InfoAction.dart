import 'package:async_redux/async_redux.dart';
import 'package:falcon_net/Model/Data/Cadet.dart';
import 'package:falcon_net/Model/Store/GlobalState.dart';

class InfoAction extends ReduxAction<GlobalState> {
  final CadetProperty property;
  final dynamic value;
  
  InfoAction({required this.property, required this.value});

  @override
  GlobalState? reduce() {
    return state.modified(GlobalStateProperty.cadet, state.cadet.modified(property, value));
  }
}