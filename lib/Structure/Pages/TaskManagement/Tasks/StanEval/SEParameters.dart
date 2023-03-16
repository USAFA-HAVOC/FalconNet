import '../../../../../Model/Database/UnitGrades.dart';
import '../../../../../Model/Database/UserGrades.dart';
import '../../../../../Model/Database/UserSummary.dart';

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
}

class SEParameters {
  final String name;
  final UnitGrades grades;

  const SEParameters({required this.name, required this.grades});
}

class SEEventParameters {
  final String type;
  final int index;
  final List<UserSummary> members;

  const SEEventParameters({required this.type, required this.index, required this.members});
}