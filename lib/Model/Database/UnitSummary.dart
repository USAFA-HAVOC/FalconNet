import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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