import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:falcon_net/Model/Database/Attendee.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:built_collection/built_collection.dart';

import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';
import 'package:falcon_net/Model/Database/GradeSubmission.dart';
import 'package:falcon_net/Model/Database/IndividualPassStatus.dart';
import 'package:falcon_net/Model/Database/PassStatusRequest.dart';
import 'package:falcon_net/Model/Database/SchedulingEvent.dart';
import 'package:falcon_net/Model/Database/SquadronAssignRequest.dart';
import 'package:falcon_net/Model/Database/StanEvalUser.dart';
import 'package:falcon_net/Model/Database/UnitDataRequest.dart';
import 'package:falcon_net/Model/Database/UnitManagementThing.dart';
import 'package:falcon_net/Model/Database/UnitOrder.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserDelegates.dart';
import 'package:falcon_net/Model/Database/UserDelegatesList.dart';
import 'package:falcon_net/Model/Database/UserEventExcusal.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';
import 'package:falcon_net/Model/Database/UserSummary.dart';
import 'package:falcon_net/Model/Database/WingData.dart';

import 'Database/AccountabilityEvent.dart';
import 'Database/DIRequest.dart';
import 'Database/Excusal.dart';
import 'Database/FormDataList.dart';
import 'Database/FormList.dart';
import 'Database/IndividualStatusRequest.dart';
import 'Database/InitialData.dart';
import 'Database/PassHistoryModel.dart';
import 'Database/RoleRequest.dart';
import 'Database/SignRequest.dart';
import 'Database/StringRequest.dart';
import 'Database/TimedRole.dart';
import 'Database/Unit.dart';
import 'Database/UnitAssignRequest.dart';
import 'Database/UnitData.dart';
import 'Database/UnitGrades.dart';
import 'Database/UnitList.dart';
import 'Database/UnitSummary.dart';
import 'Database/UserEvent.dart';
import 'Database/UserEventStatus.dart';
import 'Database/UserList.dart';
import 'Database/UserSummaryList.dart';
import 'Database/FormOneData.dart';
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
  FormSummary,
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
  RoleRequest,
  UserSummary,
  UserSummaryList,
  UnitAssignRequest,
  SquadronAssignRequest,
  UnitList,
  Unit,
  UnitDataRequest,
  FormOneData,
  UserList,
  UnitGrades,
  Grade,
  PassStatusRequest,
  StringRequest,
  SchedulingEvent,
  FormList,
  FormDataList,
  IndividualStatusRequest,
  AccountabilityEvent,
  EventList,
  Attendee,
  Excusal,
  EventExcusal,
  RecurringExcusal,
  InitialData,
  SignRequest,
  UserEvent,
  UserEventStatus,
  UserEventExcusal,
  IndividualPassStatus,
  UnitManagementThing,
  StanEvalUser,
  UserDelegates,
  UserDelegatesList
])


final Serializers serializers = (
    _$serializers.toBuilder()
      ..add(FNDateTimeSerializer())
      ..addBuilderFactory(const FullType(BuiltList, [FullType.nullable(DateTime)]), () => ListBuilder<DateTime?>())
      ..addPlugin(StandardJsonPlugin())
).build();
