import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/FormSummary.dart';

part 'FormList.g.dart';

abstract class FormList implements Built<FormList, FormListBuilder> {
  static Serializer<FormList> get serializer => _$formListSerializer;

  BuiltList<FormSummary> get forms;

  FormList._();
  factory FormList([void Function(FormListBuilder) updates]) = _$FormList;
}