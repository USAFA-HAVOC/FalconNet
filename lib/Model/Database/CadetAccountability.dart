import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'CadetLeave.dart';
import 'CadetPass.dart';


part 'CadetAccountability.g.dart';

abstract class CadetAccountability implements Built<CadetAccountability, CadetAccountabilityBuilder> {
  static Serializer<CadetAccountability> get serializer => _$cadetAccountabilitySerializer;

  CadetPass? get current_pass;
  CadetLeave? get current_leave;
  int? get weekend_overnight_passes;
  int? get weekday_overnight_passes;
  int? get weekday_day_passes;
  bool get individual_pass_status;
  bool get effective_pass_status;
  int get class_year_idx;

  CadetAccountability._();
  factory CadetAccountability([void Function(CadetAccountabilityBuilder) updates]) = _$CadetAccountability;
}
