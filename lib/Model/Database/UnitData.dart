import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'User.dart';

part 'UnitData.g.dart';

abstract class UnitData implements Built<UnitData, UnitDataBuilder> {
  static Serializer<UnitData> get serializer => _$unitDataSerializer;

  int get signed;
  int get unsigned;
  int get out;
  int get total;
  int? get group;
  String get name;
  BuiltList<User> get members;

  UnitData._();
  factory UnitData([void Function(UnitDataBuilder) updates]) = _$UnitData;
}