import '../../../../../Model/Database/UnitGrades.dart';
import '../../../../../Model/Database/UserGrades.dart';
import '../../../../../Model/Database/UserSummary.dart';

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