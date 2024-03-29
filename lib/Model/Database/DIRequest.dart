import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'DIRequest.g.dart';

abstract class DIRequest implements Built<DIRequest, DIRequestBuilder> {
  static Serializer<DIRequest> get serializer => _$dIRequestSerializer;

  String get cadet_id;

  DIRequest._();
  factory DIRequest([void Function(DIRequestBuilder) updates]) = _$DIRequest;
}