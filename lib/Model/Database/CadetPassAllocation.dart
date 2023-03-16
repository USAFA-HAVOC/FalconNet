import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'CadetPassAllocation.g.dart';

abstract class CadetPassAllocation implements Built<CadetPassAllocation, CadetPassAllocationBuilder> {
  static Serializer<CadetPassAllocation> get serializer => _$cadetPassAllocationSerializer;

  int? get weekend_overnight_passes;
  int? get weekday_overnight_passes;
  int? get weekday_day_passes;
  bool get individual_pass_status;
  bool get effective_pass_status;
  int get class_year_idx;

  CadetPassAllocation._();
  factory CadetPassAllocation([void Function(CadetPassAllocationBuilder) updates]) = _$CadetPassAllocation;
}
