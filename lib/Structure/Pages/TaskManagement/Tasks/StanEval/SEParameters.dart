import 'package:falcon_net/Model/Database/StanEvalUser.dart';

import '../../../../../Model/Database/GradeType.dart';
import '../../../../../Model/Database/UnitGrades.dart';

class SEParameters {
  final String name;
  final UnitGrades grades;

  const SEParameters({required this.name, required this.grades});
}

class SEEventParameters {
  final GradeType type;
  final int index;
  final List<StanEvalUser> members;
  final UnitGrades grades;

  const SEEventParameters({required this.type, required this.index, required this.members, required this.grades});
}