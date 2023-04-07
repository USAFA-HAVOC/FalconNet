import '../../Model/Database/UnitGrades.dart';
import '../../Model/Database/UserGrades.dart';
import '../../Model/Database/UserSummary.dart';

class GradeBoard {
  Map<int, Map<UserSummary, Grade>> amis;
  Map<int, Map<UserSummary, Grade>> samis;
  Map<int, Map<UserSummary, Grade>> pais;

  Map<UserSummary, Grade> getRow(String type, int index) {
    if (type == "ami") {
      return amis[index]!;
    }
    else if (type == "sami") {
      return samis[index]!;
    }
    else if (type == "pai") {
      return pais[index]!;
    }
    throw Exception("Cannot retrieve event of type $type!");
  }

  GradeBoard({required this.amis, required this.samis, required this.pais});

  GradeBoard.fromUnitGrades({required UnitGrades unit}) :
        amis = <int, Map<UserSummary, Grade>>{},
        samis = <int, Map<UserSummary, Grade>>{},
        pais = <int, Map<UserSummary, Grade>>{}
  {
    var grades = unit.grades;

    UserSummary findID(String id) {
      return unit.members.firstWhere((m) => m.user_id == id);
    }

    for (var user in grades.entries) {
      for (var ami in user.value.amis) {
        amis.putIfAbsent(ami.index, () => {});
        amis[ami.index]!.putIfAbsent(findID(user.key), () => ami);
      }

      for (var sami in user.value.samis) {
        samis.putIfAbsent(sami.index, () => {});
        samis[sami.index]!.putIfAbsent(findID(user.key), () => sami);
      }

      for (var pai in user.value.pais) {
        pais.putIfAbsent(pai.index, () => {});
        pais[pai.index]!.putIfAbsent(findID(user.key), () => pai);
      }
    }
  }

  double average(String type) {
    Map<int, Map<UserSummary, Grade>> relevant;
    switch (type) {
      case "ami": {
        relevant = amis;
        break;
      }
      case "sami": {
        relevant = samis;
        break;
      }
      case "pai": {
        relevant = pais;
        break;
      }
      default: throw Exception("Unrecognized score type");
    }
    var scores = relevant.entries.map((e) => e.value.values)
        .reduce((carry, value) => carry.toList() + value.toList())
        .map((g) => g.score);
    return scores.reduce((carry, value) => carry + value) / scores.length;
  }
}