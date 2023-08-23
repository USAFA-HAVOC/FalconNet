import 'package:falcon_net/Model/Database/GradeType.dart';
import 'package:falcon_net/Model/Database/StanEvalUser.dart';

import '../../Model/Database/UnitGrades.dart';
import '../../Model/Database/UserGrades.dart';

class GradeBoard {
  Map<int, Map<StanEvalUser, Grade>> amis;
  Map<int, Map<StanEvalUser, Grade>> samis;
  Map<int, Map<StanEvalUser, Grade>> pais;

  Map<StanEvalUser, Grade> getRow(GradeType type, int index) {
    switch (type) {
      case GradeType.ami: return amis[index]!;
      case GradeType.sami: return samis[index]!;
      case GradeType.pai: return pais[index]!;
    }
  }

  GradeBoard({required this.amis, required this.samis, required this.pais});

  GradeBoard.fromUnitGrades({required UnitGrades unit}) :
        amis = <int, Map<StanEvalUser, Grade>>{},
        samis = <int, Map<StanEvalUser, Grade>>{},
        pais = <int, Map<StanEvalUser, Grade>>{}
  {
    var grades = unit.grades;

    StanEvalUser findID(String id) {
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
    Map<int, Map<StanEvalUser, Grade>> relevant;
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