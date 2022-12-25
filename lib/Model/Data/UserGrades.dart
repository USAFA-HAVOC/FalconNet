import 'package:falcon_net/Model/Store/GlobalState.dart';

class Grade {
  final int score;
  final String? description;

  Grade({required this.score, this.description});
}

class UserGrades {
  final List<Grade> amis;
  final List<Grade> samis;

  UserGrades({List<Grade>? amiScores, List<Grade>? samiScores}) :
      amis = amiScores ?? <Grade>[],
      samis = samiScores ?? <Grade>[];
}