import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'StringRequest.g.dart';

abstract class StringRequest implements Built<StringRequest, StringRequestBuilder> {
  static Serializer<StringRequest> get serializer => _$stringRequestSerializer;

  String get string;

  StringRequest._();
  factory StringRequest([void Function(StringRequestBuilder) updates]) = _$StringRequest;
}