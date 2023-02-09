import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:built_collection/built_collection.dart';

import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/Forms.dart';
import 'package:falcon_net/Model/Database/GradeSubmission.dart';
import 'package:falcon_net/Model/Database/UnitOrder.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';
import 'package:falcon_net/Model/Database/WingData.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

import 'Database/DIRequest.dart';
import 'Database/Delegate.dart';
import 'Database/TimedRole.dart';
import 'Database/UnitData.dart';
import 'Database/UnitSummary.dart';

part 'Serializers.g.dart';

@SerializersFor([
  CadetAccountability,
  CadetLeave,
  UnitOrder,
  TimedRole,
  GradeSubmission,
  Delegate,
  CadetLeaveTransportMethod,
  CadetPass,
  CadetPassAllocation,
  FormOne,
  DIRequest,
  WingData,
  UnitData,
  UnitSummary,
  User,
  UserGrades,
  UserNotification,
  UserPersonalInfo,
  UserSettings,
  GlobalState
])

final Serializers serializers =
(
    _$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
).build();