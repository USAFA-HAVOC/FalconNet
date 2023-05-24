import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'CadetLeave.dart';
import 'CadetPass.dart';


part 'UnitAssignRequest.g.dart';

abstract class UnitAssignRequest implements Built<UnitAssignRequest, UnitAssignRequestBuilder> {
  static Serializer<UnitAssignRequest> get serializer => _$unitAssignRequestSerializer;

  BuiltList<String> get units;
  String get user;
  String get assigned_unit;

  UnitAssignRequest._();
  factory UnitAssignRequest([void Function(UnitAssignRequestBuilder) updates]) = _$UnitAssignRequest;
}