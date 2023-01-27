import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/FormOne.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';

import '../Database/UserGrades.dart';


part 'GlobalStateModel.g.dart';

abstract class GlobalState implements Built<GlobalState, GlobalStateBuilder> {
  static Serializer<GlobalState> get serializer => _$globalStateSerializer;

  User get user;
  BuiltList<CadetPass> get history;
  BuiltList<UserNotification> get notifications;
  UserSettings get settings;
  UserGrades get grades;
  BuiltList<FormOne> get forms;
  BuiltList<String> get roles;
  CadetLeave? get leave;
  CadetPass? get pass;

  GlobalState._();
  factory GlobalState([void Function(GlobalStateBuilder) updates]) = _$GlobalState;
}
