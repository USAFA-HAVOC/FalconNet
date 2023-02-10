import 'dart:math';

import 'package:falcon_net/Model/Database/CadetAccountability.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';
import 'package:falcon_net/Model/Database/TimedRole.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';
import 'package:falcon_net/Model/Database/UnitSummary.dart';
import 'package:falcon_net/Model/Database/UserPersonalInfo.dart';
import 'package:built_collection/built_collection.dart';

import '../Model/Database/User.dart';

///For local testing purposes only
List<User> generateMembers(int count, String status, String unit) {
  print("generating for $unit");
  String randString(int lengthOfString){
    final random = Random();
    const allChars='AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZzEeFfGgHhIiJjKkL';
    final randomString = List.generate(lengthOfString, (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString;
  }

  List<User> members = [];

  for (int i = 0; i < count; i++) {
    DateTime di = DateTime(2000);
    if (status == "signed") {
      di = DateTime.now().subtract(const Duration(hours: 1));
    }
    CadetPass? pass;
    if (status == "out") {
      pass = CadetPass((p) => p
          ..sca_number = "q42345"
          ..zip_code = "50035"
          ..end_time = DateTime(3000)
          ..start_time = DateTime.now().subtract(Duration(days: 1))
          ..description = "Spondors"
          ..state = "Coorsorado"
          ..cadet_id = "asdfklasjdf;lasd"
          ..city = "Da Sptrings"
          ..pass_type = "Discretionary"
      );
    }
    members.add(User((b) => b
      ..personal_info = UserPersonalInfo((p) => p
          ..full_name = "${randString(5)}, ${randString(5)}"
          ..phone_number = randString(15)
          ..squadron = 25
          ..unit = unit
          ..email = "ajskdfasdfajs@usafa.edu"
          ..room_number = "2534"
          ..group = "Gra"
      ).toBuilder()
      ..accountability = CadetAccountability((a) => a
          ..di_last_signed = di
          ..di_signed_by = status == "signed" ? "narp" : null
          ..current_pass = pass?.toBuilder()
      ).toBuilder()
      ..id = randString(15)
      ..roles = BuiltList<TimedRole>().toBuilder()
    ));
  }

  return members;
}

///For local testing purposes only
UnitData generateUnit(UnitSummary info) {
  var members = generateMembers(info.signed, "signed", info.name) +
      generateMembers(info.unsigned, "unsigned", info.name) +
      generateMembers(info.out, "out", info.name);
  return UnitData((b) => b
      ..name = info.name
      ..group = info.group
      ..members = BuiltList<User>(members).toBuilder()
      ..unsigned = info.unsigned
      ..signed = info.signed
      ..out = info.out
      ..total = info.total
  );
}

///For local testing purposes only
UnitSummary generateInfo(String name, int group, [int? count]) {
  Random r = Random();
  int total = count ?? 95 + r.nextInt(10);
  int signed = r.nextInt(total);
  int out = r.nextInt(total - signed);
  int unsigned = total - signed - out;
  return UnitSummary((b) => b
      ..total = total
      ..signed = signed
      ..out = out
      ..unsigned = unsigned
      ..group = group.toString()
      ..name = name
  );
}