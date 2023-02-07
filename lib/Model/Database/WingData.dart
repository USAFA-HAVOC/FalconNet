import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'UnitSummary.dart';

part 'WingData.g.dart';

abstract class WingData implements Built<WingData, WingDataBuilder> {
  static Serializer<WingData> get serializer => _$wingDataSerializer;

  BuiltList<UnitSummary> get units;

  WingData._();
  factory WingData([void Function(WingDataBuilder) updates]) = _$WingData;
}