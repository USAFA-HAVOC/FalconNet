import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:falcon_net/Model/Database/CadetDI.dart';
import 'package:falcon_net/Model/Database/CadetLeave.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/CadetPassAllocation.dart';
import 'package:falcon_net/Model/Database/FormOne.dart';
import 'package:falcon_net/Model/Database/User.dart';
import 'package:falcon_net/Model/Database/UserGrades.dart';
import 'package:falcon_net/Model/Database/UserNotification.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:falcon_net/Model/Database/UserSettings.dart';
import 'package:falcon_net/Model/Store/GlobalStateModel.dart';

part 'Serializers.g.dart';

@SerializersFor([
  CadetDI,
  CadetLeave,
  CadetLeaveTransportMethod,
  CadetPass,
  CadetPassAllocation,
  FormOne,
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