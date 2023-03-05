import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:built_collection/built_collection.dart';

import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/Forms.dart';
import 'package:falcon_net/Model/Database/GradeSubmission.dart';
import 'package:falcon_net/Model/Database/SquadronAssignRequest.dart';
import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Database/UnitOrder.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';
import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Model/Database/WingData.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import 'Database/DIRequest.dart';
import 'Database/PassHistoryModel.dart';
import 'Database/RoleRequest.dart';
import 'Database/TimedRole.dart';
import 'Database/Unit.dart';
import 'Database/UnitAssignRequest.dart';
import 'Database/UnitData.dart';
import 'Database/UnitList.dart';
import 'Database/UnitSummary.dart';
import 'Database/UserSummaryList.dart';
import 'Store/FNDateTimeSerializer.dart';

part 'Serializers.g.dart';

@SerializersFor([
  CadetAccountability,
  CadetLeave,
  UnitOrder,
  TimedRole,
  GradeSubmission,
  CadetLeaveTransportMethod,
  CadetPass,
  CadetPassAllocation,
  FormOne,
  DIRequest,
  WingData,
  UnitData,
  UnitSummary,
  PassHistoryModel,
  User,
  UserGrades,
  UserNotification,
  UserPersonalInfo,
  UserSettings,
  GlobalState,
  RoleRequest,
  UserSummary,
  UserSummaryList,
  UnitAssignRequest,
  SquadronAssignRequest,
  UnitList,
  Unit,
  UnitDataRequest
])


final Serializers serializers = (
    _$serializers.toBuilder()
      ..add(FNDateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
).build();
