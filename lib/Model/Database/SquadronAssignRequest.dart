import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';



part 'SquadronAssignRequest.g.dart';

abstract class SquadronAssignRequest implements Built<SquadronAssignRequest, SquadronAssignRequestBuilder> {
  static Serializer<SquadronAssignRequest> get serializer => _$squadronAssignRequestSerializer;

  BuiltList<String> get users;
  int get squadron;

  SquadronAssignRequest._();
  factory SquadronAssignRequest([void Function(SquadronAssignRequestBuilder) updates]) = _$SquadronAssignRequest;
}