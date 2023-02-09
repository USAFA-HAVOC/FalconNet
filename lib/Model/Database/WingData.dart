import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:falcon_net/Model/Database/UnitData.dart';

import 'UnitSummary.dart';

part 'WingData.g.dart';

abstract class WingData implements Built<WingData, WingDataBuilder> {
  static Serializer<WingData> get serializer => _$wingDataSerializer;

  BuiltList<UnitSummary> get units;

  WingData set(UnitData unit) {
    return (toBuilder()..units =
        BuiltList<UnitSummary>(
            units.where((u) => u.name != unit.name).toList() +
              [
                UnitSummary((b) => b
                    ..name = unit.name
                    ..group = unit.group
                    ..unsigned = unit.unsigned
                    ..out = unit.out
                    ..signed = unit.signed
                    ..total = unit.total
                )
              ]
        ).toBuilder()
    ).build().sorted();
  }
  
  WingData sorted() {
    return (toBuilder()..units =
    BuiltList<UnitSummary>(
        units.toList()..sort((a, b) => a.name.compareTo(b.name))
    ).toBuilder()
    ).build();
  }

  WingData._();
  factory WingData([void Function(WingDataBuilder) updates]) = _$WingData;
}