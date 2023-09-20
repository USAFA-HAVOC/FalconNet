import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/AccountabilityEvent.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';
import 'package:falcon_net/Model/Database/InitialData.dart';
import 'package:falcon_net/Model/Database/UserEvent.dart';
import 'package:falcon_net/Model/Database/UserStatus.dart';

import '../Database/CadetAccountability.dart';
import '../Database/CadetPass.dart';
import '../Database/FormList.dart';
import '../Database/TimedRole.dart';
import '../Database/User.dart';
import '../Database/UserGrades.dart';
import '../Database/UserPersonalInfo.dart';

final defaultUser = User((u) => u
  ..ms_oid = ""
  ..id = ""
  ..roles = (<TimedRole>[]).build().toBuilder()
  ..personal_info = UserPersonalInfo((p) => p
    ..full_name = "Du Lee"
    ..email = "C26Du.Lee@afacademy.af.edu"
    ..phone_number = "2345677876"
    ..room_number = "2G40"
  ).toBuilder()
  ..accountability = CadetAccountability((a) => a
    ..class_year_idx = 3
    ..effective_pass_status = true
    ..individual_pass_status = true
  ).toBuilder()
);

final defaultHistory = <CadetPass>[
  CadetPass((p) => p
    ..description = "This is a demo pass log"
    ..id = "Demo"
    ..start_time = DateTime.now().subtract(const Duration(days: 1))
    ..end_time = DateTime.now()
    ..pass_type = "SCA"
    ..sca_number = "23423"
    ..cadet_id = "Demo"
    ..state = "Colorado"
    ..city = "Colorado Springs"
  )
].build().toBuilder();

final defaultGrades = UserGrades((u) => u
  ..amis = <Grade>[
    Grade((g) => g
      ..description = "Demo AMI Grade Description #1"
      ..score = 98
      ..index = 0
    ),
    Grade((g) => g
      ..description = "Demo AMI Grade Description #2"
      ..score = 96
      ..index = 1
    )
  ].build().toBuilder()

  ..samis = <Grade>[
    Grade((g) => g
      ..description = "Demo SAMI Grade Description #1"
      ..score = 45
      ..index = 0
    ),
    Grade((g) => g
      ..description = "Demo SAMI Grade Description #2"
      ..score = 97
      ..index = 1
    )
  ].build().toBuilder()

  ..pais = <Grade>[
    Grade((g) => g
      ..description = "Demo PAI Grade Description #1"
      ..score = 95
      ..index = 0
    ),
    Grade((g) => g
      ..description = "Demo PAI Grade Description #2"
      ..score = 92
      ..index = 1
    )
  ].build().toBuilder()
);

final defaultForms = FormList((f) => f
    ..forms = <FormSummary>[
      FormSummary((f) => f
        ..title = "Demo Form"
        ..description = "This is a signable document, which by some accounts, may be signed."
        ..form_id = "demo1"
        ..signed = false
      ),
      FormSummary((f) => f
        ..title = "Demo Form #2"
        ..description = "I think you get the point."
        ..form_id = "demo2"
        ..signed = false
      ),
    ].build().toBuilder()
);

final defaultEvents = ListBuilder<UserEvent>([
  UserEvent((e) => e
      ..event_id = "demo_di_id"
      ..type = EventType.di.name
      ..accountability_method = AccountabilityMethod.di.name
      ..time = DateTime.now().add(const Duration(hours: 3))
      ..status = UserStatus.unsigned.name
      ..submission_start = DateTime.now().subtract(const Duration(hours: 0, minutes: 30))
      ..submission_deadline = DateTime.now().add(const Duration(hours: 3, minutes: 30))
  )
]).build();

final InitialData initial = InitialData((i) => i
    ..user = defaultUser.toBuilder()
    ..pass_history = defaultHistory
    ..grades = defaultGrades.toBuilder()
    ..events = defaultEvents.toBuilder()
);

final demoEndpoints = <String, dynamic Function(dynamic)>{
  "/pages/home" : (_) => initial,
  "/profile/info" : (_) => defaultUser,
  "/passes/history" : (_) => defaultHistory,
  "/grades/info" : (_) => defaultGrades,
  "/forms/info" : (_) => defaultForms,
  "/passes/create" : (pass) => pass,
  "/leave/create" : (leave) => leave,
  "/profile/edit" : (_) => true,
  "/leave/update" : (_) => true,
  "/leave/clear" : (_) => true,
  "/passes/update" : (_) => true,
  "/passes/close" : (_) => true,
  "/events/sign" : (_) => true,
};