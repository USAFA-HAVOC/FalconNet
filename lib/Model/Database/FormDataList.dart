import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/FormOneData.dart';

part 'FormDataList.g.dart';

abstract class FormDataList implements Built<FormDataList, FormDataListBuilder> {
  static Serializer<FormDataList> get serializer => _$formDataListSerializer;

  BuiltList<FormOneData> get forms;

  FormDataList._();
  factory FormDataList([void Function(FormDataListBuilder) updates]) = _$FormDataList;
}