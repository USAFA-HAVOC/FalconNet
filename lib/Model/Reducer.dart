import 'package:falcon_net/Model/Cadet.dart';
import 'package:falcon_net/Model/GlobalState.dart';

GlobalState reducer(GlobalState state, dynamic action) {
  return GlobalState(cadet: Cadet(name: "Rylie Anderson"));
}