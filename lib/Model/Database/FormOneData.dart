import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'UserSummary.dart';

part 'FormOneData.g.dart';

abstract class FormOneData implements Built<FormOneData, FormOneDataBuilder> {
  static Serializer<FormOneData> get serializer => _$formOneDataSerializer;

  String? get form_id;
  String get title;
  String get description;
  BuiltMap<String, bool> get signatures;
  BuiltList<UserSummary> get members;

  FormOneData._();
  factory FormOneData([void Function(FormOneDataBuilder) updates]) = _$FormOneData;
}
