import 'dart:math';

import '../Model/Data/DIStatus.dart';
import '../Structure/Pages/TaskManagement/Tasks/Shared/CWOCData.dart';
import '../Structure/Pages/TaskManagement/Tasks/Shared/Signee.dart';

///For local testing purposes only
List<Signee> generateMembers(int count, DIStatus status) {
  String randString(int lengthOfString){
    final random = Random();
    const allChars='AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZzEeFfGgHhIiJjKkL';
    final randomString = List.generate(lengthOfString, (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString;    // return the generated string
  }

  List<Signee> members = [];

  for (int i = 0; i < count; i++) {
    members.add(Signee(name: "Narpy Cadet #" + randString(5), id: randString(15), status: status));
  }

  return members;
}

///For local testing purposes only
UnitData generateUnit(UnitInfo info) {
  var members = generateMembers(info.signed, DIStatus.signedDI) +
      generateMembers(info.unsigned, DIStatus.unsigned) +
      generateMembers(info.out, DIStatus.signedOut);
  return UnitData(
    signed: info.signed,
    out: info.out,
    unsigned: info.unsigned,
    name: info.name,
    members: members,
    group: info.group,
  );
}

///For local testing purposes only
UnitInfo generateInfo(String name, int group, [int? count]) {
  Random r = Random();
  int total = count ?? 95 + r.nextInt(10);
  int signed = r.nextInt(total);
  int out = r.nextInt(total - signed);
  int unsigned = total - signed - out;
  return UnitInfo(
    signed: signed,
    out: out,
    unsigned: unsigned,
    name: name,
    group: group,
  );
}