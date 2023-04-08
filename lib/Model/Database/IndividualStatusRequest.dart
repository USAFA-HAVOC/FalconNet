import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'IndividualStatusRequest.g.dart';

abstract class IndividualStatusRequest implements Built<IndividualStatusRequest, IndividualStatusRequestBuilder> {
  static Serializer<IndividualStatusRequest> get serializer => _$individualStatusRequestSerializer;

  String get user_id;
  bool get status;

  IndividualStatusRequest._();
  factory IndividualStatusRequest([void Function(IndividualStatusRequestBuilder) updates]) = _$IndividualStatusRequest;
}