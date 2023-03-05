import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';

part 'Unit.g.dart';

abstract class Unit implements Built<Unit, UnitBuilder> {
  static Serializer<Unit> get serializer => _$unitSerializer;

  String get name;
  String? get group;
  bool get is_squadron;
  String get pass_status;
  String? get id;

  Unit._();
  factory Unit([void Function(UnitBuilder) updates]) = _$Unit;
}