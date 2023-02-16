import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:falcon_net/Model/Database/CadetPass.dart';

import 'TimedRole.dart';

part 'RoleRequest.g.dart';

abstract class RoleRequest implements Built<RoleRequest, RoleRequestBuilder> {
  static Serializer<RoleRequest> get serializer => _$roleRequestSerializer;

  String get user_id;
  BuiltList<TimedRole> get roles_to_add;

  RoleRequest._();
  factory RoleRequest([void Function(RoleRequestBuilder) updates]) = _$RoleRequest;
}