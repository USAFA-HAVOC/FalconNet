import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';

import '../Database/PassHistoryModel.dart';
import '../Database/UserGrades.dart';
import 'AppStatus.dart';


part 'GlobalState.g.dart';

abstract class GlobalState implements Built<GlobalState, GlobalStateBuilder> {
  AppStatus get status;
  User get user;
  PassHistoryModel? get history;
  UserSettings get settings;
  UserGrades? get grades;
  BuiltList<FormSummary>? get forms;
  CadetLeave? get leave;
  CadetPass? get pass;

  GlobalState._();
  factory GlobalState([void Function(GlobalStateBuilder) updates]) = _$GlobalState;
}
