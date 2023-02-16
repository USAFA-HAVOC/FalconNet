import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UserGrades.g.dart';

abstract class Grade implements Built<Grade, GradeBuilder> {
  static Serializer<Grade> get serializer => _$gradeSerializer;

  int get score;
  String? get description;

  Grade._();
  factory Grade([void Function(GradeBuilder) updates]) = _$Grade;
}

abstract class UserGrades implements Built<UserGrades, UserGradesBuilder> {
  static Serializer<UserGrades> get serializer => _$userGradesSerializer;

  BuiltList<Grade> get amis;
  BuiltList<Grade> get samis;
  BuiltList<Grade>? get pais;

  UserGrades._();
  factory UserGrades([void Function(UserGradesBuilder) updates]) = _$UserGrades;
}
