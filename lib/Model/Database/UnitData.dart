import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'Unit.dart';
import 'User.dart';

part 'UnitData.g.dart';

abstract class UnitData implements Built<UnitData, UnitDataBuilder> {
  static Serializer<UnitData> get serializer => _$unitDataSerializer;

  int get signed;
  int get unsigned;
  int get out;
  int get total;
  Unit get unit;
  BuiltList<User> get members;

  UnitData sign(User member) {

    return (toBuilder()
      ..signed = signed + 1
      ..unsigned = unsigned - 1
      ..members=BuiltList<User>((members.where((u) => u.id != member.id).toList() + [member.sign()])).toBuilder()
    ).build();
  }

  UnitData._();
  factory UnitData([void Function(UnitDataBuilder) updates]) = _$UnitData;
}