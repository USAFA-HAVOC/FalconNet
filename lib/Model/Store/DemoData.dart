import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';

import '../Database/CadetAccountability.dart';
import '../Database/CadetPass.dart';
import '../Database/CadetPassAllocation.dart';
import '../Database/PassHistoryModel.dart';
import '../Database/TimedRole.dart';
import '../Database/User.dart';
import '../Database/UserGrades.dart';
import '../Database/UserPersonalInfo.dart';

final defaultUser = User((u) => u
  ..id = ""
  ..roles = (<TimedRole>[]).build().toBuilder()
  ..personal_info = UserPersonalInfo((p) => p
    ..full_name = "Du Lee"
    ..email = "C26Du.Lee@afacademy.af.edu"
    ..phone_number = "2345677876"
    ..room_number = "2G40"
    ..squadron = 12
    ..group = "CG02"
    ..unit = "CS25"
  ).toBuilder()
  ..pass_allocation = CadetPassAllocation((a) => a
    ..individual_pass_status = true
    ..effective_pass_status = true
    ..class_year_idx = 3
    ..weekday_day_passes = 2
    ..weekday_overnight_passes = 1
    ..weekend_overnight_passes = 1
  ).toBuilder()
  ..accountability = CadetAccountability((a) => a
    ..di_last_signed = DateTime.now().toUtc()
    ..di_signed_by = "DemoID"
    ..di_signed_name = "Hugh Mann"
  ).toBuilder()
);

final defaultHistory = PassHistoryModel((h) => h
  ..history = <CadetPass>[
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
      ..zip_code = "50035"
    )
  ].build().toBuilder()
);

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

final defaultForms = <FormSummary>[
  FormSummary((f) => f
      ..title = "Demo Form"
      ..description = "This is a signable document, which by some accounts, may be signed."
      ..signed = false
  ),
  FormSummary((f) => f
    ..title = "Demo Form #2"
    ..description = "I think you get the point."
    ..signed = false
  ),
].build();

final demoEndpoints = <String, dynamic Function(dynamic)>{
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
  "/accountability/self-sign" : (_) => true
};