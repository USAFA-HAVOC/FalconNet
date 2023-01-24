import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'FormOne.g.dart';

abstract class FormOne implements Built<FormOne, FormOneBuilder> {
  static Serializer<FormOne> get serializer => _$formOneSerializer;

  String get title;
  String get description;
  bool get signed;

  FormOne._();
  factory FormOne([void Function(FormOneBuilder) updates]) = _$FormOne;
}
