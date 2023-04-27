import 'package:falcon_net/Model/Database/GradeType.dart';

import '../../Model/Database/UnitGrades.dart';
import '../../Model/Database/UserGrades.dart';
import '../../Model/Database/UserSummary.dart';

class GradeBoard {
  Map<int, Map<UserSummary, Grade>> amis;
  Map<int, Map<UserSummary, Grade>> samis;
  Map<int, Map<UserSummary, Grade>> pais;

  Map<UserSummary, Grade> getRow(GradeType type, int index) {
    switch (type) {
      case GradeType.ami: return amis[index]!;
      case GradeType.sami: return samis[index]!;
      case GradeType.pai: return pais[index]!;
    }
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

  double average(GradeType type) {
    Map<int, Map<UserSummary, Grade>> relevant;
    switch (type) {
      case GradeType.ami:
        relevant = amis;
        break;

      case GradeType.sami:
        relevant = samis;
        break;

      case GradeType.pai:
        relevant = pais;
        break;
    }
    var scores = relevant.entries.map((e) => e.value.values)
        .reduce((carry, value) => carry.toList() + value.toList())
        .map((g) => g.score);
    return scores.reduce((carry, value) => carry + value) / scores.length;
  }
}