import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/IndividualPassStatus.dart';

import 'Unit.dart';

part 'UnitManagementThing.g.dart';

abstract class UnitManagementThing implements Built<UnitManagementThing, UnitManagementThingBuilder> {
  static Serializer<UnitManagementThing> get serializer => _$unitManagementThingSerializer;

  BuiltList<IndividualPassStatus> get members;
  Unit get unit;

  UnitManagementThing._();
  factory UnitManagementThing([void Function(UnitManagementThingBuilder) updates]) = _$UnitManagementThing;
}