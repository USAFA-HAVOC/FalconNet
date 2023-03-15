import '../../../../../Model/Database/UnitGrades.dart';
import '../../../../../Model/Database/UserGrades.dart';
import '../../../../../Model/Database/UserSummary.dart';

class GradeBoard {
  List<Map<UserSummary, Grade>> amis;
  List<Map<UserSummary, Grade>> samis;
  List<Map<UserSummary, Grade>> pais;

  Map<UserSummary, Grade> getRow(String type, int index) {
    if (type == "ami") {
      return amis[index];
    }
    else if (type == "sami") {
      return samis[index];
    }
    else if (type == "pai") {
      return pais[index];
    }
    throw Exception("Cannot retrieve event of type $type!");
  }

  GradeBoard({required this.amis, required this.samis, required this.pais});

  GradeBoard.fromUnitGrades({required UnitGrades unit}) :
        amis = [],
        samis = [],
        pais = []
  {
    var grades = unit.grades;

    UserSummary findID(String id) {
      return unit.members.firstWhere((m) => m.user_id == id);
    }

    for (var user in grades.entries) {
      int a = 0;
      for (var ami in user.value.amis) {
        if (a < amis.length) {
          amis[a][findID(user.key)] = ami;
        }
        else {
          amis.add({findID(user.key) : ami});
        }
        a++;
      }

      int s = 0;
      for (var sami in user.value.samis) {
        if (s < samis.length) {
          samis[s][findID(user.key)] = sami;
        }
        else {
          samis.add({findID(user.key) : sami});
        }
        s++;
      }

      int p = 0;
      for (var pai in user.value.pais) {
        if (p < pais.length) {
          pais[p][findID(user.key)] = pai;
        }
        else {
          pais.add({findID(user.key) : pai});
        }
        p++;
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