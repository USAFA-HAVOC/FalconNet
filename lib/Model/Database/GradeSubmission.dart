import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'GradeSubmission.g.dart';

abstract class GradeSubmission implements Built<GradeSubmission, GradeSubmissionBuilder> {
  static Serializer<GradeSubmission> get serializer => _$gradeSubmissionSerializer;

  String? get id;
  BuiltList<String> get cadets;
  String get grader_id;
  String get type;
  int get number;
  int get value;
  String get description;

  GradeSubmission._();
  factory GradeSubmission([void Function(GradeSubmissionBuilder) updates]) = _$GradeSubmission;
}