import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Unit.dart';

part 'UnitList.g.dart';

abstract class UnitList implements Built<UnitList, UnitListBuilder> {
  static Serializer<UnitList> get serializer => _$unitListSerializer;

  BuiltList<Unit> get units;

  UnitList._();
  factory UnitList([void Function(UnitListBuilder) updates]) = _$UnitList;
}