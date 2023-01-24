import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'CadetPassAllocation.g.dart';

abstract class CadetPassAllocation implements Built<CadetPassAllocation, CadetPassAllocationBuilder> {
  static Serializer<CadetPassAllocation> get serializer => _$cadetPassAllocationSerializer;

  int? get weekend_overnight_passes;
  int? get weekday_overnight_passes;
  int? get weekday_day_passes;
  String? get individual_pass_status;
  String? get effective_pass_status;

  CadetPassAllocation._();
  factory CadetPassAllocation([void Function(CadetPassAllocationBuilder) updates]) = _$CadetPassAllocation;
}
