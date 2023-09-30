

/*
String randString(int lengthOfString){
  final random = Random();
  const allChars='AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZzEeFfGgHhIiJjKkL';
  final randomString = List.generate(lengthOfString, (index) => allChars[random.nextInt(allChars.length)]).join();
  return randomString;
}

///For local testing purposes only
List<User> generateMembers(int count, UserStatus status, String unit) {
  List<User> members = [];

  for (int i = 0; i < count; i++) {
    CadetPass? pass;
    if (status == UserStatus.out) {
      pass = CadetPass((p) => p
          ..sca_number = "q42345"
          ..end_time = DateTime(3000)
          ..start_time = DateTime.now().subtract(const Duration(days: 1))
          ..description = "Spondors"
          ..state = "Coorsorado"
          ..cadet_id = "asdfklasjdf;lasd"
          ..city = "Da Sptrings"
          ..pass_type = "Discretionary"
      );
    }
    members.add(User((b) => b
      ..ms_oid = ""
      ..personal_info = UserPersonalInfo((p) => p
          ..full_name = "${randString(5)}, ${randString(5)}"
          ..phone_number = randString(15)
          ..email = "ajskdfasdfajs@usafa.edu"
          ..room_number = "2534"
      ).toBuilder()
      ..accountability = CadetAccountability((a) => a
          ..current_pass = pass?.toBuilder()
          ..individual_pass_status = true
          ..effective_pass_status = true
          ..class_year_idx = 0
      ).toBuilder()
      ..id = randString(15)
      ..roles = BuiltList<TimedRole>().toBuilder()
    ));
  }

  return members;
}

///For local testing purposes only
UnitData generateUnit(UnitSummary info) {
  var members = generateUserSummaries(info.total!);

  return UnitData((b) => b
      ..members = BuiltList<UserSummary>(members).toBuilder()
      ..unsigned = info.unsigned
      ..signed = info.signed
      ..out = info.out
      ..total = info.total
      ..unit = (UnitBuilder()
          ..name = info.unit.name
          ..pass_status = info.unit.pass_status.toBuilder()
      )
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
      ..unit = (UnitBuilder()
          ..pass_status = [true, true, true, true].build().toBuilder()
          ..name = name
      )
  );
}

Grade randomGrade() => Grade((g) => g
    ..score = Random().nextInt(20) + 80
    ..description = List<String>.generate(50, (index) => randString(Random().nextInt(5) + 5)).reduce((carry, value) => "$carry $value")
);

UserGrades randomUserGrades() => UserGrades((g) => g
  ..amis = List<Grade>.generate(Random().nextInt(7), (_) => randomGrade()).build().toBuilder()
  ..samis = List<Grade>.generate(Random().nextInt(3), (_) => randomGrade()).build().toBuilder()
  ..pais = List<Grade>.generate(Random().nextInt(3), (_) => randomGrade()).build().toBuilder()
);

List<UserSummary> generateUserSummaries(int count) {
  String room = randString(4);
  int charge = Random().nextInt(3) + 1;
  String pullRoom() {
    if (charge == 0) {
      room = randString(4);
      charge = Random().nextInt(3) + 1;
    }
    charge -= 1;
    return room;
  }
  return List<UserSummary>.generate(count, (index) => UserSummary((u) => u
    ..name = "${randString(5)} ${randString(10)}"
    ..user_id = "user_${randString(10)}"
    ..room = pullRoom()
    ..individual_pass_status = true
    ..events = ListBuilder([
      (
          UserEventBuilder()
            ..status = "unsigned"
            ..event_id = 'test1'
            ..type = EventType.di.name
            ..time = DateTime.now()
            ..accountability_method = AccountabilityMethod.di.name
      ).build(),

      (
          UserEventBuilder()
            ..status = "unsigned"
            ..event_id = 'test2'
            ..type = EventType.di.name
            ..time = DateTime.now()
            ..accountability_method = AccountabilityMethod.di.name
      ).build()
    ])
  ));
}

Map<UserSummary, UserGrades> generateGradeMap(int count) =>
    Map.fromEntries(generateUserSummaries(count).map((u) => MapEntry(u, randomUserGrades())));


UnitGrades generateGrades([int count = 20]) {
  var map = generateGradeMap(count);
  return UnitGrades((u) => u
      ..grades = map.map((summary, grade) => MapEntry(summary.user_id, grade)).build().toBuilder()
      ..members = map.keys.toList().build().toBuilder()
  );
}

void testSigning() {
  var unit = generateUnit(generateInfo("test", 1, 10));
  var member = unit.members.last;
  print(unit.sign(member, event: "test1").members.firstWhere((m) => m.user_id == member.user_id).status(event: "test1"));
}
 */