import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'FormSummary.g.dart';

abstract class FormSummary implements Built<FormSummary, FormSummaryBuilder> {
  static Serializer<FormSummary> get serializer => _$formSummarySerializer;

  String get title;
  String get description;
  bool get signed;

  FormSummary._();
  factory FormSummary([void Function(FormSummaryBuilder) updates]) = _$FormSummary;
}
