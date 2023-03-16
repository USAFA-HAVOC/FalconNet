import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserGrades.dart';
import 'UserSummary.dart';

part 'UnitGrades.g.dart';

abstract class UnitGrades implements Built<UnitGrades, UnitGradesBuilder> {
  static Serializer<UnitGrades> get serializer => _$unitGradesSerializer;
  
  BuiltList<UserSummary> get members;
  BuiltMap<String, UserGrades> get grades;

  UnitGrades._();
  factory UnitGrades([void Function(UnitGradesBuilder) updates]) = _$UnitGrades;
}