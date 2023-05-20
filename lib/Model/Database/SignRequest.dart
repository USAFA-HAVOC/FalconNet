import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SignRequest.g.dart';

abstract class SignRequest implements Built<SignRequest, SignRequestBuilder> {
  static Serializer<SignRequest> get serializer => _$signRequestSerializer;

  String get event_id;
  String? get user_id;

  SignRequest._();
  factory SignRequest([void Function(SignRequestBuilder) updates]) = _$SignRequest;
}