import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'Unit.dart';

part 'UnitSummary.g.dart';

abstract class UnitSummary implements Built<UnitSummary, UnitSummaryBuilder> {
  static Serializer<UnitSummary> get serializer => _$unitSummarySerializer;

  int? get signed;
  int? get unsigned;
  int? get out;
  int? get total;
  Unit get unit;

  UnitSummary._();
  factory UnitSummary([void Function(UnitSummaryBuilder) updates]) = _$UnitSummary;
}