import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:falcon_net/Model/Database/Unit.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';

import 'UnitSummary.dart';

part 'WingData.g.dart';

abstract class WingData implements Built<WingData, WingDataBuilder> {
  static Serializer<WingData> get serializer => _$wingDataSerializer;

  BuiltList<UnitSummary> get units;

  WingData set(UnitData unit) {
    return (toBuilder()..units =
        BuiltList<UnitSummary>(
            units.where((u) => u.unit.name != unit.unit.name).toList() +
              [
                UnitSummary((b) => b
                    ..unsigned = unit.unsigned
                    ..out = unit.out
                    ..leave = unit.leave
                    ..excused = unit.excused
                    ..overdue = unit.overdue
                    ..out_returning = unit.out_returning
                    ..signed = unit.signed
                    ..total = unit.total
                    ..unit = Unit((u) => u
                        ..name = unit.unit.name
                        ..pass_status = unit.unit.pass_status.toBuilder()
                    ).toBuilder()
                )
              ]
        ).toBuilder()
    ).build().sorted();
  }
  
  WingData sorted() {
    return (toBuilder()..units =
    BuiltList<UnitSummary>(
        units.toList()..sort((a, b) => a.unit.name.compareTo(b.unit.name))
    ).toBuilder()
    ).build();
  }

  WingData._();
  factory WingData([void Function(WingDataBuilder) updates]) = _$WingData;
}