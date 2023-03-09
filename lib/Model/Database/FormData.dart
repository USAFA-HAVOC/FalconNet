import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'UserSummary.dart';

part 'FormData.g.dart';

abstract class FormData implements Built<FormData, FormDataBuilder> {
  static Serializer<FormData> get serializer => _$formDataSerializer;

  String get title;
  String get description;
  Map<UserSummary, bool> get signatures;

  FormData._();
  factory FormData([void Function(FormDataBuilder) updates]) = _$FormData;
}
