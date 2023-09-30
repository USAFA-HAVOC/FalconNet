import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Unit.g.dart';

abstract class Unit implements Built<Unit, UnitBuilder> {
  static Serializer<Unit> get serializer => _$unitSerializer;

  String? get id;
  String get name;
  BuiltList<bool> get pass_status;
  BuiltList<String> get parent_units;
  BuiltList<String> get sub_units;

  Unit._();
  factory Unit([void Function(UnitBuilder) updates]) = _$Unit;
}