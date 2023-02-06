import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'Forms.g.dart';

abstract class FormOne implements Built<FormOne, FormOneBuilder> {
  static Serializer<FormOne> get serializer => _$formOneSerializer;

  String get title;
  String get description;
  bool get signed;

  FormOne._();
  factory FormOne([void Function(FormOneBuilder) updates]) = _$FormOne;
}
