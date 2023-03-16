import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PassStatusRequest.g.dart';

abstract class PassStatusRequest implements Built<PassStatusRequest, PassStatusRequestBuilder> {
  static Serializer<PassStatusRequest> get serializer => _$passStatusRequestSerializer;

  int get index;
  bool get status;

  PassStatusRequest._();
  factory PassStatusRequest([void Function(PassStatusRequestBuilder) updates]) = _$PassStatusRequest;
}